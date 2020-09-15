import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Theme.of(context).platform == TargetPlatform.iOS ? CupertinoActivityIndicator() : CircularProgressIndicator(),
      ),
    );
  }
}
