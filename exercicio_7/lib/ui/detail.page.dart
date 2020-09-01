import 'package:exercicio7start/models/new.model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPageArguments {
  final New newModel;

  DetailPageArguments(this.newModel);
}

class DetailPage extends StatefulWidget {
  final DetailPageArguments args;

  DetailPage(this.args);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0B1723),
        title: Text(
          widget.args.newModel.author,
          style: TextStyle(fontSize: 24),
        ),
        leading: new IconButton(
          color: Colors.white,
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(initialUrl: widget.args.newModel.url),
    );
  }
}
