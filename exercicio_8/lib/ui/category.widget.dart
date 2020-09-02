import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  String label;

  Category({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          height: 25,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0x900076FF),
          ),
          child: Padding(
            padding:
            const EdgeInsets.only(left: 25, right: 25),
            child: Center(
              child: Text(
                this.label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
