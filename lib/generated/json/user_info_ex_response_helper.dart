import 'package:flutter_tiktok/model/response/user_info_ex_response.dart';

userInfoExResponseFromJson(UserInfoExResponse data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = new UserInfoExUser().fromJson(json['user']);
	}
	if (json['followerCount'] != null) {
		data.followerCount = json['followerCount'] is String
				? int.tryParse(json['followerCount'])
				: json['followerCount'].toInt();
	}
	if (json['followingCount'] != null) {
		data.followingCount = json['followingCount'] is String
				? int.tryParse(json['followingCount'])
				: json['followingCount'].toInt();
	}
	if (json['likeCount'] != null) {
		data.likeCount = json['likeCount'] is String
				? int.tryParse(json['likeCount'])
				: json['likeCount'].toInt();
	}
	if (json['relation'] != null) {
		data.relation = json['relation'].toString();
	}
	return data;
}

Map<String, dynamic> userInfoExResponseToJson(UserInfoExResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	data['followerCount'] = entity.followerCount;
	data['followingCount'] = entity.followingCount;
	data['likeCount'] = entity.likeCount;
	data['relation'] = entity.relation;
	return data;
}

userInfoExUserFromJson(UserInfoExUser data, Map<String, dynamic> json) {
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

Map<String, dynamic> userInfoExUserToJson(UserInfoExUser entity) {
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