import 'package:flutter_tiktok/generated/json/base/json_convert_content.dart';

class PublishFeedRequest with JsonConvert<PublishFeedRequest> {
	int type;
	PublishFeedContent content;
	PublishFeedLocation location;
	String device;
	int aclType;
	int commentType;
}

class PublishFeedContent with JsonConvert<PublishFeedContent> {
	String text;
	List<PublishFeedContentTag> tag;
	List<PublishFeedContentAt> at;
	List<PublishFeedContentAttachmants> attachments;
	PublishFeedContentMusic music;
}

class PublishFeedContentTag with JsonConvert<PublishFeedContentTag> {
	int id;
	String name;
	int start;
	int end;
}

class PublishFeedContentAt with JsonConvert<PublishFeedContentAt> {
	int id;
	String name;
	int start;
	int end;
}

class PublishFeedContentAttachmants with JsonConvert<PublishFeedContentAttachmants> {
	int type;
	String url;
	String cover;
	String gifCover;
	int duration;
	int width;
	int height;
}

class PublishFeedContentMusic with JsonConvert<PublishFeedContentMusic> {
	int id;
	String name;
	String url;
	String img;
}

class PublishFeedLocation with JsonConvert<PublishFeedLocation> {
	String latitude;
	String longitude;
	String cityCode;
	String adCode;
	String address;
	String name;
}
