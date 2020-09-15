import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

import '../models/video.model.dart';
import '../network/api.dart';

class VideosBloc extends BlocBase {
  Api _api;
  List<Video> _videos;

  final StreamController<List<Video>> _videosController = StreamController<
      List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    _api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(String query) async {
    if (query != null) {
      _videosController.sink.add([]);
      _videos = await _api.search(query);
    }else{
      _videos += await _api.nextPage();
    }

    _videosController.sink.add(_videos);
  }

  @override
  void dispose() {
    super.dispose();
    _videosController.close();
    _searchController.close();
  }
}