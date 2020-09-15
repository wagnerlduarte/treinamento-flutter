import 'dart:convert';

import 'package:exemplo11/models/video.model.dart';
import 'package:http/http.dart' as http;

const API_KEY = 'AIzaSyDo7NrEQ0nD-dRFFZsT0mrY0e7IYpZgnkk';

//"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"

class Api {
  String _search;
  String _nextToken;

  Future<List<Video>> search(String search) async {
    _search = search;

    http.Response response = await http.get(
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10',
    );

    return decode(response);
  }

  Future<List<Video>> nextPage() async {
    http.Response response = await http.get(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken'
    );

    return decode(response);
  }

  List<Video> decode(http.Response  response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      _nextToken = decoded['nextPageToken'];

      List<Video> videos = decoded['items'].map<Video>(
          (map) {
            return Video.fromJson(map);
          }
      ).toList();

      print(videos);

      return videos;
    } else {
      throw Exception('deu pau tio');
    }
  }
}
