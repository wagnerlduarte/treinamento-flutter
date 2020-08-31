import 'package:flutter/material.dart';

import 'food.model.dart';

class FoodDetailPageArguments {
  final FoodModel foodModel;

  FoodDetailPageArguments(this.foodModel);
}

class FoodDetailPage extends StatefulWidget {
  static const routeName = '/second';
  final FoodDetailPageArguments args;

  FoodDetailPage(this.args);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {

  bool _checkBoxValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.args.foodModel.type)),
        body: Container(
          color: Colors.red,
          child: Column(
            children: [
              Hero(
                  tag: 'image',
                  child: Image.asset('assets/images/position_1.png')),
              Text('${widget.args.foodModel.numberOfComments}'),
              Row(children: [
                Text('Chicken breast'),
                Spacer(),
                Checkbox(value: _checkBoxValue, onChanged: (bool value) { setState(() {
                  _checkBoxValue = value;
                });},)
              ],)
            ],
          ),
        ));
  }
}
