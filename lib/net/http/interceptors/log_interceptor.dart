library pretty_dio_logger;

import 'dart:async';
import 'dart:math' as math;

import 'package:dio/dio.dart';

class LogInterceptors extends Interceptor {
  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to logPrint json response
  static const int initialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per logPrint
  final int maxWidth;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  void Function(Object object) logPrint;

  LogInterceptors(
      {this.request = true,
      this.requestHeader = false,
      this.requestBody = false,
      this.responseHeader = false,
      this.responseBody = true,
      this.error = true,
      this.maxWidth = 90,
      this.compact = true,
      this.logPrint = print});

  @override
  Future onRequest(RequestOptions options) async {
    if (request) {
      _printRequestHeader(options);
    }
    if (requestHeader) {
      _printMapAsTable(options.queryParameters, header: 'Query Parameters');
      final requestHeaders = Map();
      if (options.headers != null) {
        requestHeaders.addAll(options.headers);
      }
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType?.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout;
      requestHeaders['receiveTimeout'] = options.receiveTimeout;
      _printMapAsTable(requestHeaders, header: 'Headers');
      _printMapAsTable(options.extra, header: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      final data = options.data;
      if (data != null) {
        if (data is Map) _printRequestBody(options.data, header: 'RequestBody');
        if (data is FormData) {
          final formDataMap = Map()
            ..addEntries(data.fields)
            ..addEntries(data.files);
          _printMapAsTable(formDataMap, header: 'Form data | ${data.boundary}');
        }
      }
    }
    return options;
  }

  @override
  Future onError(DioError err) async {
    if (error) {
      if (err.type == DioErrorType.RESPONSE) {
        final uri = err.response.request.uri;
        _printBoxed(
            header:
                'DioError ║ Status: ${err.response.statusCode} ${err.response.statusMessage}',
            text: uri.toString());
        if (err.response != null && err.response.data != null) {
          logPrint('╔ ${err.type.toString()}');
          _printResponse(err.response);
        }
        _printLine('╚');
        logPrint('');
      } else
        _printBoxed(header: 'DioError ║ ${err.type}', text: err.message);
    }
    return err;
  }

  @override
  Future onResponse(Response response) async {
    _printResponseHeader(response);
    if (responseHeader) {
      final responseHeaders = Map<String, String>();
      response.headers
          .forEach((k, list) => responseHeaders[k] = list.toString());
      _printMapAsTable(responseHeaders, header: 'Headers');
    }

    if (responseBody) {
      logPrint('╔ Body');
      logPrint('║');
      _printResponse(response);
      logPrint('║');
      _printLine('╚');
    }

    return response;
  }

  void _printBoxed({String header, String text}) {
    logPrint('');
    logPrint('╔╣ $header');
    logPrint('║  $text');
    _printLine('╚');
  }

  void _printResponse(Response response) {
    if (response.data != null) {
      if (response.data is Map)
        _printPrettyMap(response.data);
      else if (response.data is List) {
        logPrint('║${_indent()}[');
        _printList(response.data);
        logPrint('║${_indent()}[');
      } else
        _printBlock(response.data.toString());
    }
  }

  void _printResponseHeader(Response response) {
    final uri = response?.request?.uri;
    final method = response.request.method;
    _printBoxed(
        header:
            'Response ║ $method ║ Status: ${response.statusCode} ${response.statusMessage}',
        text: uri.toString());
  }

  void _printRequestHeader(RequestOptions options) {
    final uri = options?.uri;
    final method = options?.method;
    _printBoxed(header: 'Request ║ $method ', text: uri.toString());
  }

  void _printLine([String pre = '', String suf = '╝']) =>
      logPrint('$pre${'═' * maxWidth}');

  void _printKV(String key, Object v) {
    final pre = '╟ $key: ';
    final msg = v.toString();

    if (pre.length + msg.length > maxWidth) {
      logPrint(pre);
      _printBlock(msg);
    } else
      logPrint('$pre$msg');
  }

  void _printBlock(String msg) {
    int lines = (msg.length / maxWidth).ceil();
    for (int i = 0; i < lines; ++i) {
      logPrint((i >= 0 ? '║ ' : '') +
          msg.substring(i * maxWidth,
              math.min<int>(i * maxWidth + maxWidth, msg.length)));
    }
  }

  String _indent([int tabCount = initialTab]) => tabStep * tabCount;

  void _printPrettyMap(Map data,
      {int tabs = initialTab, bool isListItem = false, bool isLast = false}) {
    final bool isRoot = tabs == initialTab;
    final initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) logPrint('║$initialIndent{');

    data.keys.toList().asMap().forEach((index, key) {
      final isLast = index == data.length - 1;
      var value = data[key];
//      key = '\"$key\"';
      if (value is String)
        value = '\"${value.toString().replaceAll(RegExp(r'(\r|\n)+'), " ")}\"';
      if (value is Map) {
        if (compact && _canFlattenMap(value))
          logPrint('║${_indent(tabs)} $key: $value${!isLast ? ',' : ''}');
        else {
          logPrint('║${_indent(tabs)} $key: {');
          _printPrettyMap(value, tabs: tabs);
        }
      } else if (value is List) {
        if (compact && _canFlattenList(value))
          logPrint('║${_indent(tabs)} $key: ${value.toString()}');
        else {
          logPrint('║${_indent(tabs)} $key: [');
          _printList(value, tabs: tabs);
          logPrint('║${_indent(tabs)} ]${isLast ? '' : ','}');
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        final indent = _indent(tabs);
        final linWidth = maxWidth - indent.length;
        if (msg.length + indent.length > linWidth) {
          int lines = (msg.length / linWidth).ceil();
          for (int i = 0; i < lines; ++i) {
            logPrint(
                '║${_indent(tabs)} ${msg.substring(i * linWidth, math.min<int>(i * linWidth + linWidth, msg.length))}');
          }
        } else
          logPrint('║${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}');
      }
    });

    logPrint('║$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  void _printList(List list, {int tabs = initialTab}) {
    list.asMap().forEach((i, e) {
      final isLast = i == list.length - 1;
      if (e is Map) {
        if (compact && _canFlattenMap(e))
          logPrint('║${_indent(tabs)}  $e${!isLast ? ',' : ''}');
        else
          _printPrettyMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
      } else
        logPrint('║${_indent(tabs + 2)} $e${isLast ? '' : ','}');
    });
  }

  bool _canFlattenMap(Map map) {
    return map.values.where((val) => val is Map || val is List).isEmpty &&
        map.toString().length < maxWidth;
  }

  bool _canFlattenList(List list) {
    return (list.length < 10 && list.toString().length < maxWidth);
  }

  void _printMapAsTable(Map map, {String header}) {
    if (map == null || map.isEmpty) return;
    logPrint('╔ $header ');
    map.forEach((key, value) => _printKV(key, value));
    _printLine('╚');
  }

  void _printRequestBody(Map map, {String header}) {
    if (map == null || map.isEmpty) return;
    logPrint('╔ $header ');
    _printPrettyMap(map);
    _printLine('╚');
  }
}
