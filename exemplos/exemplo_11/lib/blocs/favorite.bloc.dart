import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:exemplo11/models/video.model.dart';

class FavoriteBloc extends BlocBase {
  Map<String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favController = StreamController<Map<String, Video>>.broadcast();
  Stream<Map<String, Video>> get outFav => _favController.stream;

  void toggleFavorite(Video video){
  if(_favorites.containsKey(video.id))
    {
      _favorites.remove(video.id);
    }else{
    _favorites[video.id] = video;
  }

    _favController.sink.add(_favorites);
    _saveFav();
  }

  _saveFav() {
    /*SharedPreferences.getInstance().then(
          (prefs) => {
        prefs.setString('favorites', json.encode(_favorites)),
      },
    );*/
  }

  @override
  void dispose() {
    super.dispose();
    _favController.close();
  }
}