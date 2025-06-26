import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/full_screen_player.dart';
import 'package:toktik/presentation/widgets/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    /// PageView: Widget that allow us scroll at full screen.
    /// Takes all the full screen of the mobile screen.
    /// .builder: Will build our children on demand, instead of building all the elements
    /// in just one build.  (very heavy and not efficient)
    return PageView.builder(
      /// Add this if we are working on Android
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,

      /// This is very efficient. We are building our
      /// items on demand.
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];
        return Stack(
          children: [
            // Video Player + Gradient
            FullScreenPlayer(videoUrl: video.url, caption: video.caption),
            // Buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video),
            ),
          ],
        );
      },

      /// If we have a lot of children here,
      /// we need to be awarenes that all is loaded in memory
      /// in just once build. (very heavy)
      // children: [
      //   Container(color: Colors.red),
      //   Container(color: Colors.blue),
      // ],
    );
  }
}
