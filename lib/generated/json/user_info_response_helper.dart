import 'package:flutter_tiktok/model/response/user_info_response.dart';

userInfoResponseFromJson(UserInfoResponse data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid'] is String
				? int.tryParse(json['uid'])
				: json['uid'].toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['portrait'] != null) {
		data.portrait = json['portrait'].toString();
	}
	if (json['bio'] != null) {
		data.bio = json['bio'].toString();
	}
	if (json['birth'] != null) {
		data.birth = json['birth'].toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender'] is String
				? int.tryParse(json['gender'])
				: json['gender'].toInt();
	}
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['profession'] != null) {
		data.profession = json['profession'].toString();
	}
	if (json['create_time'] != null) {
		data.createTime = json['create_time'] is String
				? int.tryParse(json['create_time'])
				: json['create_time'].toInt();
	}
	return data;
}

Map<String, dynamic> userInfoResponseToJson(UserInfoResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['nickname'] = entity.nickname;
	data['portrait'] = entity.portrait;
	data['bio'] = entity.bio;
	data['birth'] = entity.birth;
	data['gender'] = entity.gender;
	data['city'] = entity.city;
	data['profession'] = entity.profession;
	data['create_time'] = entity.createTime;
	return data;
}