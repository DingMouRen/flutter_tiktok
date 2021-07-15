import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/net/http/interceptors/header_interceptor.dart';

import 'base_response.dart';
import '../http_constant.dart';
import 'http_error.dart';
import 'http_method.dart';
import 'interceptors/log_interceptor.dart';

class HttpManager {
  Map<String, CancelToken> _cancelTokens = Map();

  ///默认的超时时间
  static const int CONNECT_TIMEOUT = 30 * 1000;
  static const int RECEIVE_TIMEOUT = 30 * 1000;

  Dio _dio,_dioUpload;


  ///单例对象
  static HttpManager _instance;

  /// 内部构造函数，类似于java中private修饰的构造函数
  HttpManager._internal() {
    //初始化操作
    if (null == _dio) {
      BaseOptions options = BaseOptions(
        baseUrl: HttpConstant.baseUrl,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      _dio = Dio(options);
      //添加拦截器
      _dio.interceptors.add(HeaderInterceptor());
      _dio.interceptors.add(LogInterceptors(requestHeader: true,requestBody: true,responseHeader: true,responseBody: true));

    }
    //初始化操作
    if (null == _dioUpload) {
      BaseOptions options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      _dioUpload = Dio(options);
      //添加拦截器
      _dioUpload.interceptors.add(LogInterceptors(requestHeader: true,requestBody: true,responseHeader: true,responseBody: true));

    }
  }

  factory HttpManager.getInstance() => _getInstance();

  static HttpManager _getInstance() {
    if (null == _instance) {
      _instance = HttpManager._internal();
    }
    return _instance;
  }


  ///get请求
  Future get(
      {@required String url,
      @required String cancelTokenTag,
      Map<String, dynamic> params,
      Options options,
      }) async {
    return await _requestHttp(
        url: url,
        method: HttpMethod.GET,
        cancelTokenTag: cancelTokenTag,
        params: params,
        options: options,
    );
  }

  ///post请求
  Future post(
      {@required String url,
      @required String cancelTokenTag,
      Map<String, dynamic> params,
      data,
      Options options,
      }) async {
    return await _requestHttp(
        url: url,
        method: HttpMethod.POST,
        cancelTokenTag: cancelTokenTag,
        params: params,
        data: data,
        options: options,
    );
  }

  ///put请求
  Future put(
      {@required String url,
        @required String cancelTokenTag,
        Map<String, dynamic> params,
        data,
        Options options,
        int typeHttp
      }) async {
    return await _requestHttp(
        url: url,
        method: HttpMethod.PUT,
        cancelTokenTag: cancelTokenTag,
        params: params,
        data: data,
        options: options,
    );
  }

  Future _requestHttp(
      {@required String url,
      String method,
      @required String cancelTokenTag,
      Map<String, dynamic> params,
      data,
      Options options}) async {
    //请求中loading
    EasyLoading.show();
    //检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw (HttpError(HttpError.NETWORK_ERROR, "网络异常，请检查网络"));
    }

    //设置默认值
    params = params ?? {};
    method = method ?? 'GET';
    options?.method = method;
    options = options ??
        Options(
          method: method,
        );
    url = _restfulUrl(url, params);

    CancelToken cancelToken;
    if (cancelTokenTag != null) {
      cancelToken = _cancelTokens[cancelTokenTag] == null ? CancelToken() : _cancelTokens[cancelTokenTag];
      _cancelTokens[cancelTokenTag] = cancelToken;
    }

    try {
      Response<Map<String, dynamic>> response = await _dio.request(url,
          queryParameters: params,
          data: data,
          options: options,
          cancelToken: cancelToken);
      EasyLoading.dismiss();
      if(null != response){
        if(response.data['code'] == 0){
          return BaseResponse.fromJson(response.data).data;
        }else{
          EasyLoading.showToast(response.data['message']);
          return null;
        }
      }

     } catch(e,s){
      EasyLoading.dismiss();
      print(e);
     }

  }


  Future<bool> uploadFile(
      {@required String url,
        String method,
        @required String cancelTokenTag,
        Map<String, dynamic> params,
        data,
        Options options}) async {
    //请求中loading
    EasyLoading.show();
    //检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw (HttpError(HttpError.NETWORK_ERROR, "网络异常，请检查网络"));
    }

    //设置默认值
    params = params ?? {};
    method = method ?? 'GET';
    options?.method = method;
    options = options ??
        Options(
          method: method,
        );
    url = _restfulUrl(url, params);

    CancelToken cancelToken;
    if (cancelTokenTag != null) {
      cancelToken = _cancelTokens[cancelTokenTag] == null ? CancelToken() : _cancelTokens[cancelTokenTag];
      _cancelTokens[cancelTokenTag] = cancelToken;
    }

    try {
      Response response = await _dioUpload.request(url,
          queryParameters: params,
          data: data,
          options: options,
          cancelToken: cancelToken);
      EasyLoading.dismiss();
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    } catch(e,s){
      EasyLoading.dismiss();
      print(e);
    }

  }




  ///restful处理
  String _restfulUrl(String url, Map<String, dynamic> params) {
    // restful 请求处理
    // /gysw/search/hist/:user_id        user_id=27
    // 最终生成 url 为     /gysw/search/hist/27
    params.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    return url;
  }

  ///取消网络请求
  void cancel(String cancelTokenTag) {
    if (_cancelTokens.containsKey(cancelTokenTag)) {
      if (!_cancelTokens[cancelTokenTag].isCancelled) {
        _cancelTokens[cancelTokenTag].cancel();
      }
      _cancelTokens.remove(cancelTokenTag);
    }
  }

}
