class BaseResponse{
  dynamic data;
  String code;
  String msg;

  BaseResponse(this.data, this.code, this.msg);

  BaseResponse.fromJson(Map<String,dynamic> json){
    data = json['data'];
    code = json['code'];
    msg = json['msg'];
  }


}