import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String id = 'search_page';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text(
          'Index 2: Search',
        ),
      ),
    );
  }
}
