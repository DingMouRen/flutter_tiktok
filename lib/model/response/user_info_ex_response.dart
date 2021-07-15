import 'package:flutter_tiktok/generated/json/base/json_convert_content.dart';
import 'package:flutter_tiktok/generated/json/base/json_field.dart';

class UserInfoExResponse with JsonConvert<UserInfoExResponse> {
	UserInfoExUser user;
	int followerCount;
	int followingCount;
	int likeCount;
	String relation;
}

class UserInfoExUser with JsonConvert<UserInfoExUser> {
	int uid;
	String nickname;
	String portrait;
	String bio;
	String birth;
	int gender;
	String city;
	String profession;
	@JSONField(name: "create_time")
	int createTime;
}
