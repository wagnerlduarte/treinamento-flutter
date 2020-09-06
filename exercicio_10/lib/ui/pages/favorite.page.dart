import 'dart:convert';

import 'package:exercicio_10/ui/components/list_item.widget.dart';
import 'package:exercicio_10/ui/components/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  dynamic _favorites;
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    _loadFavorites();
  }

  _loadFavorites() async {
    List<String> vehicles = List();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    vehicles = prefs.getStringList('favorites');

    _favorites = vehicles.map((e) => jsonDecode(e)).toList();

    loaded = true;

    setState(() {});
  }

  _buildFavoriteList() {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var vehicle = this._favorites[index];
          return ListItem(
            text:
                '${vehicle['marca']} - ${vehicle['name']} - ${vehicle['preco']}',
          );
        },
        itemCount: this._favorites.length,
      ),
    );
  }

  _buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.announcement,
          size: 50,
          color: Colors.deepOrangeAccent,
        ),
        SizedBox(height: 20),
        Text(
          'Nenhum favorito cadastrado',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_favorites == null && !loaded) {
      return Loader();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
        leading: new IconButton(
          color: Colors.white,
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: _favorites == null ? _buildEmpty() : _buildFavoriteList()),
    );
  }
}
