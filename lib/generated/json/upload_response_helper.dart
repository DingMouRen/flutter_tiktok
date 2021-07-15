import 'package:flutter_tiktok/model/response/upload_response.dart';

uploadResponseFromJson(UploadResponse data, Map<String, dynamic> json) {
	if (json['effectUrl'] != null) {
		data.effectUrl = json['effectUrl'].toString();
	}
	return data;
}

Map<String, dynamic> uploadResponseToJson(UploadResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['effectUrl'] = entity.effectUrl;
	return data;
}