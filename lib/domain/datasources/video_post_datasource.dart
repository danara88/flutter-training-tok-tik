import 'package:toktik/domain/entities/video_post.dart';

/// I don't care where the data is comming from.
/// The concern of that will be for those which implements the class.
abstract class IVideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
