import 'package:boringmusicapp/colors.dart';
import 'package:flutter/material.dart';
import 'package:boringmusicapp/components/customButton.dart';
import 'package:boringmusicapp/pages/home_page.dart';

class NowplayingPage extends StatefulWidget {
  static const String id = 'nowplaying_page';

  @override
  _NowplayingPageState createState() => _NowplayingPageState();
}

class _NowplayingPageState extends State<NowplayingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: White,
        iconTheme: IconThemeData(color: PrimaryPurple),
        title: const Text(
          'Now playing',
          style: TextStyle(color: PrimaryPurple),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.black38,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/images/placeholder_image.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: PrimaryPurple,
                  //width: (MediaQuery.of(context).size.width),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Song Name',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: White,
                                fontSize: 30.0,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Singer Name',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: White,
                                height: 1.5,
                                fontSize: 16.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: SurfaceBlack,
                child: ButtonBar(
                  alignment: MainAxisAlignment.start,
                  buttonPadding: EdgeInsets.all(0),
                  children: <Widget>[
                    CustomButton(
                      buttonColor: SurfaceBlack,
                      iconColor: SurfaceWhite,
                      icon: Icons.skip_previous,
                      borderIsVisible: false,
                      onPressed: () {},
                    ),
                    CustomButton(
                      buttonColor: SurfaceBlack,
                      iconColor: SurfaceWhite,
                      icon: Icons.skip_next,
                      borderIsVisible: false,
                      onPressed: () {},
                    ),
                    CustomButton(
                      buttonColor: SurfaceBlack,
                      iconColor: LightAquamarine,
                      icon: Icons.loop,
                      borderIsVisible: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text("played times"), Text("time")],
                  ),
                ),
              ),
//              Container(
//                child: Slider(
//                  activeColor: LightAquamarine,
//                  inactiveColor: White,
//                ),
//              )
            ],
          ),
          Positioned(
            bottom: 80,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: SurfaceWhite, width: 2.5),
                  shape: BoxShape.circle,
                  color: SurfaceBlack),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  iconSize: 72,
                  icon: Icon(Icons.pause),
                  color: SurfaceWhite,
                  splashColor: DarkAquamarine,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
