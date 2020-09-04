import 'dart:async';

import 'package:exercicio_9/models/dog.response.dart';
import 'package:exercicio_9/network/api.dart';
import 'package:exercicio_9/ui/image.component.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  DogResponse _dogResponse = DogResponse();
  String _lastSearch = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _searchQuery = TextEditingController();
  Timer _debounce;

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (_searchQuery.text.isEmpty) {
        _lastSearch = '';
        _dogResponse = DogResponse();
      } else if (_searchQuery.text != _lastSearch) {
        _lastSearch = _searchQuery.text;
        _loadDog(_searchQuery.text);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _searchQuery.addListener(_onSearchChanged);
    setState(() {});
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();
    _debounce.cancel();
    super.dispose();
  }

  _loadDog(String breed) async {
    _dogResponse = await Api.retrieveDog(breed);
    setState(() {});
  }

  _buildError() {
    return Center(
      child: Column(
        children: [
          Text(
            'The breed you typed was not found, so we will show \'Vira-lata Caramelo\', one of the most famous do breed in Brazil.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Image.asset('assets/caramelo.jpg'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Type the breed you want to see:',
          style: TextStyle(fontSize: 18),
        ),
        Form(
          key: _formKey,
          child: TextFormField(
            controller: _searchQuery,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        if (_dogResponse != null &&
            _dogResponse.message != null &&
            _dogResponse.message.isNotEmpty)
          ImageComponent(
            imagePath: _dogResponse.message,
            errorBuilder: _buildError,
          ),
        SizedBox(
          height: 40,
        ),
        if (_dogResponse.message != null &&
            _dogResponse.message.isNotEmpty &&
            _dogResponse.status == 'success')
          RaisedButton(
            child: Text(
              'Another one',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            color: Colors.blue,
            onPressed: () {
              _loadDog(_searchQuery.text);
            },
          ),
      ],
    );
  }
}
