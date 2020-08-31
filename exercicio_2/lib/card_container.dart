import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  Color roundedColor;
  IconData icon;
  String title;
  String description;

  CardContainer({
    @required this.roundedColor,
    @required this.icon,
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: this.roundedColor,
          ),
          height: 45,
          width: 45,
          child: Center(
            child: Icon(
              this.icon,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  this.description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}