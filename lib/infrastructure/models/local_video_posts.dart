import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  /// Map the properties in your source data
  /// then we can change it later if api response changes.
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'] ?? 'No Video Name',
        videoUrl: json['videoUrl'] ?? 'No Video Url',
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
      );

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, url: videoUrl, likes: likes, views: views);
}
