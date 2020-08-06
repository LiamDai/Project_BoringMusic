import 'package:flutter/material.dart';
import 'package:boringmusicapp/colors.dart';

class SettingPage extends StatefulWidget {
  static const String id = 'setting_page';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: PrimaryPurple,
            ),
            child: Text(
              'Add something here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Index1'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Index2'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Index3'),
          ),
        ],
      ),
    );
  }
}
