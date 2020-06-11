import 'package:katstagram/model/user.dart';

class Post {
  User user;
  String img, caption;
  bool liked = false;

  Post({this.user, this.img, this.caption, this.liked = false});
}
