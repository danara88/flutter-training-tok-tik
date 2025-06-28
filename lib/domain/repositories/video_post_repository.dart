import 'package:toktik/domain/entities/video_post.dart';

/// The repository will call the data source.
/// We want to separate repository and data source becuase in the future
/// we want to change the data spurce easily without issues.
abstract class IVideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
