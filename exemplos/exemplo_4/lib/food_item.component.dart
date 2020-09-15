import 'package:exemplo_4/food.model.dart';
import 'package:exemplo_4/food_detail.page.dart';
import 'package:flutter/material.dart';

class FoodItemComponent extends StatelessWidget {
  int position;
  FoodModel foodModel;

  FoodItemComponent(@required this.foodModel);

  _goToDetail(BuildContext context) {
    Navigator.pushNamed(context, '/second', arguments: FoodDetailPageArguments(this.foodModel));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetail(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
            color: Colors.grey,
            height: 160,
            width: double.infinity,
            child: Stack(
              children: [
                Hero(tag: 'image',child: Image.asset('assets/images/position_1.png')),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'First dish',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('601'),
                                  SizedBox(width: 4),
                                  Icon(Icons.favorite),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('19'),
                                  SizedBox(width: 4),
                                  Icon(Icons.wb_cloudy),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
