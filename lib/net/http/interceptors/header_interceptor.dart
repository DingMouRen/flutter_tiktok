import 'package:dio/dio.dart';
import 'package:flutter_tiktok/common/sp_keys.dart';
import 'package:flutter_tiktok/util/sp_util.dart';

class HeaderInterceptor implements Interceptor{
  @override
  Future onError(DioError err)async {
    return err;
  }

  @override
  Future onRequest(RequestOptions options) async{
    int userUid = -1;
    await SPUtil.getInt(SPKeys.userUid).then((uid){
      userUid = uid;
    });
    String token = '';
    await SPUtil.getString(SPKeys.token).then((text){
      token = text;
    });

    options.headers['x-bm-uid'] = userUid??'';
    if(null != token && token.length > 0)options.headers['Authorization'] = 'Bearer ' + token??'';
    return options;
  }

  @override
  Future onResponse(Response response) async{
    return response;
  }

}