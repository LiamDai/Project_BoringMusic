import 'package:assets_audio_player/assets_audio_player.dart';

final audios = <Audio>[
  Audio.network(
    "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3",
    metas: Metas(
      id: "Online",
      title: "Online",
      artist: "Florent Champigny",
      album: "OnlineAlbum",
      image: MetasImage.network(
          "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
    ),
  ),
  Audio(
    "assets/audios/electronic.mp3",
    metas: Metas(
      id: "Electronics",
      title: "Electronic",
      artist: "Florent Champigny",
      album: "ElectronicAlbum",
      image: MetasImage.network(
          "https://i.ytimg.com/vi/nVZNy0ybegI/maxresdefault.jpg"),
    ),
  ),
];

Audio find(List<Audio> source, String fromPath) {
  return source.firstWhere((element) => element.path == fromPath);
}

AssetsAudioPlayer get assetsAudioPlayer => AssetsAudioPlayer.withId("music");
