import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapsPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapsPage({this.latitude, this.longitude});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl:
              'https://www.google.com/maps/search/?api=1&query=$widget.latitude,$widget.longitude'),
    );
  }
}
