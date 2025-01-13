import 'package:flutter/material.dart';

//This widget is a gesture detector sitting on top of the player.

class PlayerControlLayer extends StatelessWidget {
  final VoidCallback onTapFunction;
  const PlayerControlLayer({super.key, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
    );

  }
}