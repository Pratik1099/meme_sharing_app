import 'dart:convert';
import 'package:http/http.dart' as http;
import 'welcome_page.dart';

class Album {
  final String ur;
  final String subReddit;

  Album({this.ur, this.subReddit});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      ur: json['url'],
      subReddit: json['subreddit'],
    );
  }
}

Future getMemeData() async {
  final response =
      await http.get(Uri.https('meme-api.herokuapp.com', 'gimme/$memeType'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
