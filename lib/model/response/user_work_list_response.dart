import 'package:flutter_tiktok/generated/json/base/json_convert_content.dart';
import 'package:flutter_tiktok/generated/json/base/json_field.dart';

class UserWorkListResponse with JsonConvert<UserWorkListResponse> {
	@JSONField(name: "list")
	List<UserWorkListList> xList;
	int cursor;
	int count;
	bool hasMore;
}

class UserWorkListList with JsonConvert<UserWorkListList> {
	int id;
	int type;
	UserWorkListListContent content;
	UserWorkListListLocation location;
	String device;
	int aclType;
	int commentType;
	int createTime;
	UserWorkListListUser user;
	int likeCount;
	int commentCount;
	int shareCount;
	int viewCount;
	bool isFollow;
	bool isLike;
}

class UserWorkListListContent with JsonConvert<UserWorkListListContent> {
	String text;
	List<UserWorkListListContentTag> tag;
	List<UserWorkListListContentAt> at;
	List<UserWorkListListContentAttachmants> attachments;
	UserWorkListListContentMusic music;
}

class UserWorkListListContentTag with JsonConvert<UserWorkListListContentTag> {
	int id;
	String name;
	int start;
	int end;
}

class UserWorkListListContentAt with JsonConvert<UserWorkListListContentAt> {
	int id;
	String name;
	int start;
	int end;
}

class UserWorkListListContentAttachmants with JsonConvert<UserWorkListListContentAttachmants> {
	int type;
	String url;
	String cover;
	String gifCover;
	int duration;
	int width;
	int height;
}

class UserWorkListListContentMusic with JsonConvert<UserWorkListListContentMusic> {
	int id;
	String name;
	String url;
	String img;
}

class UserWorkListListLocation with JsonConvert<UserWorkListListLocation> {
	String latitude;
	String longitude;
	String cityCode;
	String adCode;
	String address;
	String name;
}

class UserWorkListListUser with JsonConvert<UserWorkListListUser> {
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
