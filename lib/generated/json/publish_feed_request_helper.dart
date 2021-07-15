import 'package:flutter_tiktok/model/request/publish_feed_request.dart';

publishFeedRequestFromJson(PublishFeedRequest data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['content'] != null) {
		data.content = new PublishFeedContent().fromJson(json['content']);
	}
	if (json['location'] != null) {
		data.location = new PublishFeedLocation().fromJson(json['location']);
	}
	if (json['device'] != null) {
		data.device = json['device'].toString();
	}
	if (json['aclType'] != null) {
		data.aclType = json['aclType'] is String
				? int.tryParse(json['aclType'])
				: json['aclType'].toInt();
	}
	if (json['commentType'] != null) {
		data.commentType = json['commentType'] is String
				? int.tryParse(json['commentType'])
				: json['commentType'].toInt();
	}
	return data;
}

Map<String, dynamic> publishFeedRequestToJson(PublishFeedRequest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.content != null) {
		data['content'] = entity.content.toJson();
	}
	if (entity.location != null) {
		data['location'] = entity.location.toJson();
	}
	data['device'] = entity.device;
	data['aclType'] = entity.aclType;
	data['commentType'] = entity.commentType;
	return data;
}

publishFeedContentFromJson(PublishFeedContent data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text'].toString();
	}
	if (json['tag'] != null) {
		data.tag = new List<PublishFeedContentTag>();
		(json['tag'] as List).forEach((v) {
			data.tag.add(new PublishFeedContentTag().fromJson(v));
		});
	}
	if (json['at'] != null) {
		data.at = new List<PublishFeedContentAt>();
		(json['at'] as List).forEach((v) {
			data.at.add(new PublishFeedContentAt().fromJson(v));
		});
	}
	if (json['attachments'] != null) {
		data.attachments = new List<PublishFeedContentAttachmants>();
		(json['attachments'] as List).forEach((v) {
			data.attachments.add(new PublishFeedContentAttachmants().fromJson(v));
		});
	}
	if (json['music'] != null) {
		data.music = new PublishFeedContentMusic().fromJson(json['music']);
	}
	return data;
}

Map<String, dynamic> publishFeedContentToJson(PublishFeedContent entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	if (entity.tag != null) {
		data['tag'] =  entity.tag.map((v) => v.toJson()).toList();
	}
	if (entity.at != null) {
		data['at'] =  entity.at.map((v) => v.toJson()).toList();
	}
	if (entity.attachments != null) {
		data['attachments'] =  entity.attachments.map((v) => v.toJson()).toList();
	}
	if (entity.music != null) {
		data['music'] = entity.music.toJson();
	}
	return data;
}

publishFeedContentTagFromJson(PublishFeedContentTag data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['start'] != null) {
		data.start = json['start'] is String
				? int.tryParse(json['start'])
				: json['start'].toInt();
	}
	if (json['end'] != null) {
		data.end = json['end'] is String
				? int.tryParse(json['end'])
				: json['end'].toInt();
	}
	return data;
}

Map<String, dynamic> publishFeedContentTagToJson(PublishFeedContentTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['start'] = entity.start;
	data['end'] = entity.end;
	return data;
}

publishFeedContentAtFromJson(PublishFeedContentAt data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['start'] != null) {
		data.start = json['start'] is String
				? int.tryParse(json['start'])
				: json['start'].toInt();
	}
	if (json['end'] != null) {
		data.end = json['end'] is String
				? int.tryParse(json['end'])
				: json['end'].toInt();
	}
	return data;
}

Map<String, dynamic> publishFeedContentAtToJson(PublishFeedContentAt entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['start'] = entity.start;
	data['end'] = entity.end;
	return data;
}

publishFeedContentAttachmantsFromJson(PublishFeedContentAttachmants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	if (json['gifCover'] != null) {
		data.gifCover = json['gifCover'].toString();
	}
	if (json['duration'] != null) {
		data.duration = json['duration'] is String
				? int.tryParse(json['duration'])
				: json['duration'].toInt();
	}
	if (json['width'] != null) {
		data.width = json['width'] is String
				? int.tryParse(json['width'])
				: json['width'].toInt();
	}
	if (json['height'] != null) {
		data.height = json['height'] is String
				? int.tryParse(json['height'])
				: json['height'].toInt();
	}
	return data;
}

Map<String, dynamic> publishFeedContentAttachmantsToJson(PublishFeedContentAttachmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['url'] = entity.url;
	data['cover'] = entity.cover;
	data['gifCover'] = entity.gifCover;
	data['duration'] = entity.duration;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}

publishFeedContentMusicFromJson(PublishFeedContentMusic data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['img'] != null) {
		data.img = json['img'].toString();
	}
	return data;
}

Map<String, dynamic> publishFeedContentMusicToJson(PublishFeedContentMusic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['url'] = entity.url;
	data['img'] = entity.img;
	return data;
}

publishFeedLocationFromJson(PublishFeedLocation data, Map<String, dynamic> json) {
	if (json['latitude'] != null) {
		data.latitude = json['latitude'].toString();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude'].toString();
	}
	if (json['cityCode'] != null) {
		data.cityCode = json['cityCode'].toString();
	}
	if (json['adCode'] != null) {
		data.adCode = json['adCode'].toString();
	}
	if (json['address'] != null) {
		data.address = json['address'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> publishFeedLocationToJson(PublishFeedLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['cityCode'] = entity.cityCode;
	data['adCode'] = entity.adCode;
	data['address'] = entity.address;
	data['name'] = entity.name;
	return data;
}