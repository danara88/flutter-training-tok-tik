import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        const SizedBox(height: 15),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 15),
        SpinPerfect(
          infinite: true,
          duration: Duration(seconds: 5),
          child: _CustomIconButton(iconData: Icons.play_circle_outline),
        ),
      ],
    );
  }
}

/// If it is a private widget, we can remove the
/// super.key, not required.
class _CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final int value;
  final Color? _color;

  const _CustomIconButton({required this.iconData, this.value = 0, iconColor})
    : _color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: _color, size: 30),
        ),
        if (value > 0) Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
