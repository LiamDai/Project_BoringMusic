import 'package:flutter/material.dart';
import 'package:boringmusicapp/components/Tabs.dart';
import 'package:boringmusicapp/components/libraryCard.dart';
import 'package:boringmusicapp/pages/playlist_page.dart';

class LibraryPage extends StatefulWidget {
  static const String id = 'library_page';

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Good evening',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Tabs(),
                SizedBox(height: 8),
                LibraryCard(),
              ],
            ),
          ),
          PlaylistPage(),
        ],
      ),
    );
  }
}
