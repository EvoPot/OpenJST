import 'package:flutter/material.dart';

//This widget is a gesture detector covering the entire screen. The player layer uses its voidCallBack function to change the visibility of the controls.

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