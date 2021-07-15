import 'package:flutter_tiktok/model/request/follow_request.dart';

followRequestFromJson(FollowRequest data, Map<String, dynamic> json) {
	if (json['actionType'] != null) {
		data.actionType = json['actionType'] is String
				? int.tryParse(json['actionType'])
				: json['actionType'].toInt();
	}
	if (json['relationUid'] != null) {
		data.relationUid = json['relationUid'] is String
				? int.tryParse(json['relationUid'])
				: json['relationUid'].toInt();
	}
	return data;
}

Map<String, dynamic> followRequestToJson(FollowRequest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['actionType'] = entity.actionType;
	data['relationUid'] = entity.relationUid;
	return data;
}