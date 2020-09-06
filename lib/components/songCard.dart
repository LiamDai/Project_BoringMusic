import 'package:boringmusicapp/colors.dart';
import 'package:flutter/material.dart';
import 'package:boringmusicapp/components/inkWellOverLay.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:boringmusicapp/components/musicResource.dart';

class SongCard extends StatefulWidget {
  const SongCard({this.openContainer});

  final VoidCallback openContainer;

  @override
  _SongCardState createState() => _SongCardState();
}

Audio find(List<Audio> source, String fromPath) {
  return source.firstWhere((element) => element.path == fromPath);
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    return InkWellOverlay(
      openContainer: widget.openContainer,
      height: 400.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: (MediaQuery.of(context).size.width - 72.0),
            height: (MediaQuery.of(context).size.width - 72.0),
            //72.0 is the width of the button in the right.
            child: Center(
              child: assetsAudioPlayer.builderCurrent(
                builder: (BuildContext context, Playing playing) {
                  if (playing != null) {
                    final myAudio = find(audios, playing.audio.assetAudioPath);
                    return Center(
                      child: myAudio.metas.image.type == ImageType.network
                          ? Image.network(
                              myAudio.metas.image.path,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              myAudio.metas.image.path,
                              fit: BoxFit.cover,
                            ),
                    );
                  }
                  return Center(
                    child: Image.asset(
                      'assets/images/placeholder_image.png',
                    ),
                  );
                },
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
