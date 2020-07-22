import 'package:flutter/material.dart';
import 'package:boringmusicapp/colors.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 10),
        MyTab(icon: Icons.brightness_low, isSelected: false),
        MyTab(icon: Icons.brightness_medium, isSelected: false),
        MyTab(icon: Icons.brightness_2, isSelected: true),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  MyTab({@required this.isSelected, @required this.icon});
  final icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(this.icon),
        color: isSelected ? DarkPurple : UnselectedIconPurple,
        splashColor: LightPurple,
      ),
    );
  }
}
