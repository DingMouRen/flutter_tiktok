import 'package:flutter_tiktok/generated/json/base/json_convert_content.dart';
import 'package:flutter_tiktok/generated/json/base/json_field.dart';

class FeedListResponse with JsonConvert<FeedListResponse> {
	@JSONField(name: "list")
	List<FeedListList> xList;
	int cursor;
	int count;
	bool hasMore;
}

class FeedListList with JsonConvert<FeedListList> {
	int id;
	int type;
	FeedListListContent content;
	FeedListListLocation location;
	String device;
	int aclType;
	int commentType;
	int createTime;
	FeedListListUser user;
	int likeCount;
	int commentCount;
	int shareCount;
	int viewCount;
	bool isFollow;
	bool isLike;
}

class FeedListListContent with JsonConvert<FeedListListContent> {
	String text;
	List<FeedListListContentTag> tag;
	List<FeedListListContentAt> at;
	List<FeedListListContentAttachmants> attachments;
	FeedListListContentMusic music;
}

class FeedListListContentTag with JsonConvert<FeedListListContentTag> {
	int id;
	String name;
	int start;
	int end;
}

class FeedListListContentAt with JsonConvert<FeedListListContentAt> {
	int id;
	String name;
	int start;
	int end;
}

class FeedListListContentAttachmants with JsonConvert<FeedListListContentAttachmants> {
	int type;
	String url;
	String cover;
	String gifCover;
	int duration;
	int width;
	int height;
}

class FeedListListContentMusic with JsonConvert<FeedListListContentMusic> {
	int id;
	String name;
	String url;
	String img;
}

class FeedListListLocation with JsonConvert<FeedListListLocation> {
	String latitude;
	String longitude;
	String cityCode;
	String adCode;
	String address;
	String name;
}

class FeedListListUser with JsonConvert<FeedListListUser> {
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
