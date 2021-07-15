import 'package:flutter_tiktok/generated/json/base/json_convert_content.dart';

class FollowResponse with JsonConvert<FollowResponse> {
	int uid;
	int actionType;
	int relationUid;
	int createTime;
}
