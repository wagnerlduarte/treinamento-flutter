import 'package:flutter/material.dart';

class FinanceContainer extends StatelessWidget {
  Color backgroundColor;
  String name;
  String ticker;
  String value;
  String gain;

  FinanceContainer({
    @required this.backgroundColor,
    @required this.name,
    @required this.ticker,
    @required this.value,
    @required this.gain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: this.backgroundColor,
      ),
      padding: EdgeInsets.all(15),
      height: 70,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Color(0X40FFFFFF),
            ),
            height: 38,
            width: 38,
            child: Center(
              child: Text(
                this.ticker.toUpperCase().substring(0,1),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    this.ticker.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '\$$value',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            this.gain,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}