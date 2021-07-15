class CameraUtil{

  ///获取从相机过来的图片后缀
  static String getImgSuffix(String path){
    var list = path.split('.');
    print('$list');
    return list[list.length - 1];
  }
}