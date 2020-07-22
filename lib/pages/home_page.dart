import 'package:boringmusicapp/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boringmusicapp/components/openContaninerWrapper.dart';
import 'package:boringmusicapp/components/songCard.dart';
import 'package:boringmusicapp/components/customButton.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
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
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: White,
              iconTheme: IconThemeData(
                color: PrimaryPurple,
              ),
              pinned: false,
              floating: true,
              snap: false,
              expandedHeight: 50.0,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: OpenContainerWrapper(
                              closedBuilder:
                                  (BuildContext _, VoidCallback openContainer) {
                                return SongCard(
                                  openContainer: openContainer,
                                );
                              },
                            ),
                          ),
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: 72.0, minWidth: 72.0),
                            child: ButtonBar(
                              buttonPadding: EdgeInsets.all(0),
                              alignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CustomButton(
                                  icon: Icons.skip_previous,
                                  buttonColor: SurfaceBlack,
                                  iconColor: SecondAquamarine,
                                  borderIsVisible: true,
                                  onPressed: () {},
                                ),
                                CustomButton(
                                  icon: Icons.skip_next,
                                  buttonColor: SurfaceBlack,
                                  iconColor: SecondAquamarine,
                                  borderIsVisible: true,
                                  onPressed: () {},
                                ),
                                CustomButton(
                                  icon: Icons.loop,
                                  buttonColor: LightPurple,
                                  iconColor: White,
                                  borderIsVisible: true,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width - 126,
                        right: 18,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: SurfaceBlack, width: 2.5),
                              shape: BoxShape.circle,
                              color: SecondAquamarine),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              iconSize: 72,
                              icon: Icon(Icons.pause),
                              color: SurfaceBlack,
                              splashColor: DarkAquamarine,
//                                    icon: AnimatedIcon(
//                                      progress: _runnerAnimationController,
//                                      icon: AnimatedIcons.play_pause,
//                                      color: Colors.white,
//                                    ),
                              onPressed: () {
//                                      if (_playerState == PlayerState.playing) {
//                                        _stop();
//                                      }
//                                      if (_playerState == PlayerState.paused ||
//                                          _playerState == PlayerState.stopped) {
//                                        _play();
//                                      };
//                                      setState(() {
//                                        isRunnerOut
//                                            ? _runnerAnimationController.reverse()
//                                            : _runnerAnimationController.forward();
//                                      });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 80.0,
              delegate: SliverChildBuilderDelegate(
                //use SliverChildBuilderDelegate to build them lazily
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text('List Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
