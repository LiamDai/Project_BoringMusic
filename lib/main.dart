import 'package:flutter/material.dart';
import 'package:boringmusicapp/pages/home_page.dart';
import 'package:boringmusicapp/pages/search_page.dart';
import 'package:boringmusicapp/pages/setting_page.dart';
import 'package:boringmusicapp/pages/library_page.dart';
import 'package:boringmusicapp/pages/playlist_page.dart';
import 'package:boringmusicapp/pages/nowplaying_page.dart';
import 'package:boringmusicapp/pages/navigation.dart';

void main() => runApp(BoringMusic());

class BoringMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: Navigation.id,
      routes: {
        Navigation.id: (context) => Navigation(),

//        We might use them in the future.
//        HomePage.id: (context) => HomePage(),
//        NowplayingPage.id: (context) => NowplayingPage(),
//        SearchPage.id: (context) => SearchPage(),
//        SettingPage.id: (context) => SettingPage(),
//        LibraryPage.id: (context) => LibraryPage(),
//        PlaylistPage.id: (context) => PlaylistPage(),
      },
    );
  }
}
// We might change this in the future.
//final ThemeData _boringTheme = _buildboringtheme();
//
//ThemeData _buildboringtheme() {
//  final ThemeData base = ThemeData.light();
//  return base.copyWith(
//      primaryColor: PrimaryPurple,
//      primaryColorDark: DarkPurple,
//      primaryColorLight: LightPurple,
//      accentColor: SecondAquamarine,
//      buttonTheme: base.buttonTheme.copyWith(
//        buttonColor: SurfaceBlack,
//        colorScheme: base.colorScheme.copyWith(
//          secondary: SecondAquamarine,
//        ),
//      ),
//      buttonBarTheme: base.buttonBarTheme.copyWith(
//        buttonTextTheme: ButtonTextTheme.accent,
//      ),
//      scaffoldBackgroundColor: BackgroundWhite,
//      cardColor: BackgroundWhite,
//      errorColor: ErrorRed,
//      textTheme: _buildShrineTextTheme(base.textTheme),
//      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
//      primaryIconTheme: base.iconTheme.copyWith(color: DarkGray),
//      inputDecorationTheme: InputDecorationTheme());
//}
//
//TextTheme _buildShrineTextTheme(TextTheme base) {
//  return base
//      .copyWith(
//        headline5: base.headline5.copyWith(
//          fontWeight: FontWeight.w500,
//        ),
//        headline6: base.headline6.copyWith(fontSize: 18.0),
//        caption: base.caption.copyWith(
//          fontWeight: FontWeight.w400,
//          fontSize: 14.0,
//        ),
//      )
//      .apply(
//        fontFamily: 'Rubik',
//        displayColor: BackgroundWhite,
//        bodyColor: BackgroundWhite,
//      );
//}
