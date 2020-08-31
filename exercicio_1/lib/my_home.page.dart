import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contextHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.purple[100],
                height: contextHeight * 0.2,
              )),
              Expanded(
                  child: Container(
                color: Colors.purple[200],
                height: contextHeight * 0.2,
              )),
              Expanded(
                  child: Container(
                color: Colors.purple[300],
                height: contextHeight * 0.2,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red[100],
                  height: contextHeight * 0.3,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red[200],
                  height: contextHeight * 0.3,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green[100],
                  height: contextHeight * 0.5,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green[200],
                  height: contextHeight * 0.5,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green[300],
                  height: contextHeight * 0.5,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green[400],
                  height: contextHeight * 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
