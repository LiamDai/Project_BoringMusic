import 'package:flutter/material.dart';
import 'package:boringmusicapp/colors.dart';
import 'dart:math';
import 'dart:ui';

class PlaylistPage extends StatefulWidget {
  static const String id = 'playlist_page';

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  double initialPercentage = 0.15;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DraggableScrollableSheet(
        minChildSize: initialPercentage,
        initialChildSize: initialPercentage,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              double percentage = initialPercentage;
              if (scrollController.hasClients) {
                percentage = (scrollController.position.viewportDimension) /
                    (MediaQuery.of(context).size.height);
              }
              double scaledPercentage =
                  (percentage - initialPercentage) / (1 - initialPercentage);
              return Container(
                padding: const EdgeInsets.only(left: 32),
                decoration: const BoxDecoration(
                  color: BackgroundBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: percentage == 1 ? 1 : 0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(right: 0, top: 0),
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          Event event = events[index % 3];
                          return MyEventItem(
                            event: event,
                            percentageCompleted: percentage,
                          );
                        },
                      ),
                    ),
                    ...events.map((event) {
                      int index = events.indexOf(event);
                      int heightPerElement = 120 + 8 + 8;
                      double widthPerElement =
                          40 + percentage * 80 + 8 * (1 - percentage);
                      double leftOffset = widthPerElement *
                          (index > 4 ? index + 2 : index) *
                          (1 - scaledPercentage);
                      return Positioned(
                        top: 44.0 +
                            scaledPercentage * (128 - 44) +
                            index * heightPerElement * scaledPercentage,
                        left: leftOffset,
                        right: 32 - leftOffset,
                        child: IgnorePointer(
                          ignoring: true,
                          child: Opacity(
                            opacity: percentage == 1 ? 0 : 1,
                            child: MyEventItem(
                              event: event,
                              percentageCompleted: percentage,
                            ),
                          ),
                        ),
                      );
                    }),
                    SheetHeader(
                      fontSize: 14 + percentage * 8,
                      topMargin:
                          16 + percentage * MediaQuery.of(context).padding.top,
                    ),
                    MenuButton(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyEventItem extends StatelessWidget {
  final Event event;
  final double percentageCompleted;

  const MyEventItem({Key key, this.event, this.percentageCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Transform.scale(
        alignment: Alignment.topLeft,
        scale: 1 / 3 + 2 / 3 * percentageCompleted,
        child: SizedBox(
          height: 80,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(16),
                  right: Radius.circular(16 * (1 - percentageCompleted)),
                ),
                child: Image.asset(
                  'assets/images/${event.assetName}',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: max(0, percentageCompleted * 2 - 1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(16)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8),
                    child: _buildContent(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(event.songName, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Text(
          event.artistName,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Spacer(),
      ],
    );
  }
}

final List<Event> events = [
  Event('placeholder_image.png', 'Song Name', 'Artist Name'),
  Event('placeholder_image.png', 'Song Name', 'Artist Name'),
  Event('placeholder_image.png', 'Song Name', 'Artist Name'),
  Event('placeholder_image.png', 'Song Name', 'Artist Name'),
  Event('placeholder_image.png', 'Song Name', 'Artist Name'),
  Event('placeholder_image.png', 'Song Name', 'Artist Name'),
];

class Event {
  final String assetName;
  final String songName;
  final String artistName;

  Event(this.assetName, this.songName, this.artistName);
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 32,
      child: IgnorePointer(
        child: Container(
          padding: EdgeInsets.only(top: topMargin, bottom: 12),
          decoration: const BoxDecoration(
            color: BackgroundBlack,
          ),
          child: Text(
            'Playing List',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 24,
      child: Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
