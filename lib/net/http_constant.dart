class HttpConstant{
  static const String baseUrl = 'https://api.fuiboom.com';

  ///登录
  static const login = '/api/user/login';

  ///注册
  static const register = '/api/user/register';

  ///获取用户资料信息
  static const userInfo = '/api/user/';

  ///获取用户资料信息(扩展)
  static const userInfoEx = '/api/x/user/';

  ///获取上传凭证
  static const uploadToken = '/api/upload/token';

  ///上传文件
  static const uploadFile = '/api/upload/resource';

  ///发布feed
  static const publishFeed = '/api/feed/publish';

  ///获取用户发布的作品列表
  static const userFeedList = '/api/feed/user/timeline';

  ///获取热门feed（推荐）
  static const hotFeedList = '/api/feed/hot';

  ///获取好友的feed列表
  static const friendFeedList = '/api/feed/friend/timeline';

  ///关注/取消关注
  static const follow = '/api/relation/follow';
}