import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int numberOfPeopleInsideTheBus = 2;

  @override
  void initState() {
    super.initState();
  }

  void _incrementPerson() {
    setState(() {
      numberOfPeopleInsideTheBus++;
    });
  }

  void _decreasePerson() {
    setState(() {
      numberOfPeopleInsideTheBus--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de pessoas'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Número de pessoas dentro do ônibus:\n'
                '$numberOfPeopleInsideTheBus',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Container(
                      child: Center(
                        child: Text('+'),
                      ),
                      color: Colors.redAccent,
                      width: 44,
                      height: 44,
                    ),
                    onPressed: _incrementPerson,
                  ),
                  FlatButton(
                    child: Container(
                      child: Center(
                        child: Text('-'),
                      ),
                      color: Colors.redAccent,
                      width: 44,
                      height: 44,
                    ),
                    onPressed: _decreasePerson,
                  ),
                ],
              ),
              Container(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
