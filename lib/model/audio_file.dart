// To parse this JSON data, do
//
//     final audioFile = audioFileFromJson(jsonString);

import 'dart:convert';

List<AudioFile> audioFileFromJson(String str) => List<AudioFile>.from(json.decode(str).map((x) => AudioFile.fromJson(x)));

String audioFileToJson(List<AudioFile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AudioFile {
    AudioFile({
      required this.name,
      required this.album,
      required this.artists,
      required this.photo,
    });

    String name;
    String album;
    String artists;
    String photo;

    factory AudioFile.fromJson(Map<String, dynamic> json) => AudioFile(
        name: json["Name"],
        album: json["Album"],
        artists: json["Artists"],
        photo: json["Photo"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Album": album,
        "Artists": artists,
        "Photo": photo,
    };
}
