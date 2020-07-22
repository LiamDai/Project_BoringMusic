import 'package:boringmusicapp/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.onPressed,
      @required this.icon,
      @required this.buttonColor,
      @required this.iconColor,
      @required this.borderIsVisible});
  final onPressed;
  final icon;
  final buttonColor;
  final iconColor;
  bool borderIsVisible;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: borderIsVisible
                ? Border.all(color: DarkGray, width: 0.5)
                : null),
        child: Ink(
          decoration: ShapeDecoration(
            color: buttonColor,
            shape: Border(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(this.icon),
              iconSize: 36.0,
              hoverColor: White,
              color: iconColor,
              splashColor: LightPurple,
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
