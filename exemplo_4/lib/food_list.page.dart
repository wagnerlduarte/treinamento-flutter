import 'package:exemplo_4/food.model.dart';
import 'package:exemplo_4/food_item.component.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Delicious')),
        body: Container(
          height: double.infinity,
          color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FoodItemComponent(FoodModel(type: 'teste', numberOfComments: 10, numberOfLikes: 10, name: 'teste')),
                  //FoodItemComponent(FoodModel(type: 'teste', numberOfComments: 10, numberOfLikes: 10, name: 'teste')),
                  //FoodItemComponent(FoodModel(type: 'teste', numberOfComments: 10, numberOfLikes: 10, name: 'teste')),
                ],
              ),
            ),
          ),
        ));
  }
}


class PopulateUtils {
  List<FoodModel> foodModelList = [
    FoodModel(type: 'teste', numberOfComments: 10, numberOfLikes: 10, name: 'teste'),
    FoodModel(type: 'teste', numberOfComments: 10, numberOfLikes: 10, name: 'teste'),
    FoodModel(type: 'teste', numberOfComments: 10, numberOfLikes: 10, name: 'teste'),
  ];
}