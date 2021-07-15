class BaseResponse{
  dynamic data;
  int code;
  String message;

  BaseResponse(this.data, this.code, this.message);

  BaseResponse.fromJson(Map<String,dynamic> json){
    data = json['data'];
    code = json['code'];
    message = json['message'];
  }


}