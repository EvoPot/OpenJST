import 'package:flutter/material.dart';
import 'videoplayerlayer.dart';

class Player extends StatefulWidget {
  final String path;
  const Player({super.key, required this.path});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayerLayer(
          file: widget.path,
        )
      ],
    );
  }
}
