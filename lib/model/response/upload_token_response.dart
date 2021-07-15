import 'package:flutter_tiktok/generated/json/base/json_convert_content.dart';
import 'package:flutter_tiktok/generated/json/base/json_field.dart';

class UploadTokenResponse with JsonConvert<UploadTokenResponse> {
	List<UploadTokenToken> tokens;
}

class UploadTokenToken with JsonConvert<UploadTokenToken> {
	String method;
	String uploadUrl;
	String effectUrl;
	UploadTokenTokensHeaders headers;
}

class UploadTokenTokensHeaders with JsonConvert<UploadTokenTokensHeaders> {
	@JSONField(name: "Authorization")
	String authorization;
	@JSONField(name: "Content-Type")
	String contentType;
	@JSONField(name: "Date")
	String date;
	@JSONField(name: "Content-Length")
	String contentLength;
	@JSONField(name: "Content-MD5")
	String contentMd5;
}
