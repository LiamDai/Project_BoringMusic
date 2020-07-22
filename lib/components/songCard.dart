import 'package:boringmusicapp/colors.dart';
import 'package:flutter/material.dart';
import 'package:boringmusicapp/components/inkWellOverLay.dart';

class SongCard extends StatelessWidget {
  const SongCard({this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return InkWellOverlay(
      openContainer: openContainer,
      height: 400.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: (MediaQuery.of(context).size.width - 72.0),
            height: (MediaQuery.of(context).size.width - 72.0),
            //72.0 is the width of the button in the right.
            child: Center(
              child: Container(
                color: Colors.black38,
                child: Center(
                  child: Image.asset(
                    'assets/placeholder_image.png',
                  ),
                ),
              ),
            ),
          ),

// TODO: We might add some lyrics in future.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Song Name',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    'Singer Name',
                    style: TextStyle(color: TextGray),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
