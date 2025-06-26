import 'package:flutter/cupertino.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_posts.dart';
import 'package:toktik/share/data/local_video_posts.dart';

/// Only until the provider is neccessary, provider will create the
/// instance (lazy loading)
class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;

  // This data should come from an external source
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> data = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(data);
    initialLoading = false;
    notifyListeners();
  }
}
