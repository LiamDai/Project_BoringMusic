import 'package:boringmusicapp/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boringmusicapp/components/openContaninerWrapper.dart';
import 'package:boringmusicapp/components/songCard.dart';
import 'package:boringmusicapp/pages/setting_page.dart';
import 'package:boringmusicapp/components/customButton.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:boringmusicapp/components/songList.dart';
import 'package:boringmusicapp/components/assetMusic.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

bool isCompleted = false;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController playPauseAnimationController;

  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    _subscriptions.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print("audioSessionId : $sessionId");
    }));
    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));

    playPauseAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();

    playPauseAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isCompleted = true;
      } else {
        isCompleted = false;
      }
    });
  }

  @override
  void dispose() {
    playPauseAnimationController.dispose();
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SettingPage(),
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
                                  onPressed: () {
                                    assetsAudioPlayer.previous(
                                        /*keepLoopMode: false*/);
                                  },
                                ),
                                CustomButton(
                                  icon: Icons.skip_next,
                                  buttonColor: SurfaceBlack,
                                  iconColor: SecondAquamarine,
                                  borderIsVisible: true,
                                  onPressed: () {
                                    assetsAudioPlayer.next(keepLoopMode: true);
                                  },
                                ),
                                CustomButton(
                                  icon: Icons.loop,
                                  buttonColor: LightPurple,
                                  iconColor: White,
                                  borderIsVisible: true,
                                  onPressed: () {
                                    assetsAudioPlayer.toggleLoop();
                                  },
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
                              color: SurfaceBlack,
                              splashColor: DarkAquamarine,
                              icon: AnimatedIcon(
                                progress: playPauseAnimationController,
                                icon: AnimatedIcons.play_pause,
                              ),
                              onPressed: () {
                                assetsAudioPlayer.playOrPause();
                                setState(() {
                                  isCompleted
                                      ? playPauseAnimationController.reverse()
                                      : playPauseAnimationController.forward();
                                });
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
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      assetsAudioPlayer.builderCurrent(
                          builder: (BuildContext context, Playing playing) {
                        return SongsSelector(
                          audios: audios,
                          onPlaylistSelected: (myAudios) {
                            assetsAudioPlayer.open(
                              Playlist(audios: myAudios),
                              showNotification: true,
                              headPhoneStrategy:
                                  HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
//                              phoneCallStrategy:
//                                  PhoneCallStrategy.pauseOnPhoneCallResumeAfter,
                            );
                          },
                          onSelected: (myAudio) async {
                            try {
                              await assetsAudioPlayer.open(
                                myAudio,
                                autoStart: true,
                                showNotification: true,
                                playInBackground: PlayInBackground.enabled,
//                                phoneCallStrategy: PhoneCallStrategy.none,
                                headPhoneStrategy:
                                    HeadPhoneStrategy.pauseOnUnplug,
                                notificationSettings: NotificationSettings(
                                    //seekBarEnabled: false,
                                    //stopEnabled: true,
                                    //customStopAction: (player){
                                    //  player.stop();
                                    //}
                                    //prevEnabled: false,
                                    //customNextAction: (player) {
                                    //  print("next");
                                    //}
                                    //customStopIcon: AndroidResDrawable(name: "ic_stop_custom"),
                                    //customPauseIcon: AndroidResDrawable(name:"ic_pause_custom"),
                                    //customPlayIcon: AndroidResDrawable(name:"ic_play_custom"),
                                    ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          playing: playing,
                        );
                      }),
                    ],
                  )
                ],
              ),
            )
//            SliverFixedExtentList(
//              itemExtent: 80.0,
//              delegate: SliverChildBuilderDelegate(
//                //use SliverChildBuilderDelegate to build them lazily
//                (BuildContext context, int index) {
//                  return Container(
//                    alignment: Alignment.center,
//                    child: Text('List Item $index'),
//                  );
//                },
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
