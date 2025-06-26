import 'package:uuid/uuid.dart';

/// Video Domain Entity
/// This represents a video in our app
class VideoPost {
  final String id = Uuid().v1().toString();
  final String caption;
  final String url;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.url,
    this.likes = 0,
    this.views = 0,
  });
}
