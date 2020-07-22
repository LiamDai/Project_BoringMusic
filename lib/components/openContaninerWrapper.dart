import 'package:boringmusicapp/pages/nowplaying_page.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    this.closedBuilder,
    this.onClosed,
  });

  final OpenContainerBuilder closedBuilder;
  final ClosedCallback<bool> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      openBuilder: (BuildContext context, VoidCallback _) {
        return NowplayingPage();
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
