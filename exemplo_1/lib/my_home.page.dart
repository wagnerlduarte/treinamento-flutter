import 'package:flutter/material.dart';

import 'finance_container.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onPlusButtonPressed() {
      print('pressed');
    }

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF413E65),
            title: Text('Current Portifolio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ))),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFF413E65),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 55,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('BALANCE',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0X80FFFFFF),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('\$103,463',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            )),
                        Text('.59',
                            style: TextStyle(
                              fontSize: 34,
                              color: Color(0X80FFFFFF),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        Text('+ 28.20%',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF2AF598),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text('today',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0x80FFFFFF),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 37,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Your Coins',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            )),
                        Spacer(),
                        FlatButton(
                            onPressed: _onPlusButtonPressed,
                            child: Text('+',
                                style: TextStyle(
                                  fontSize: 60,
                                  color: Color(0xFF2AF598),
                                ))),
                      ],
                    ),
                    FinanceContainer(
                      backgroundColor: Color(0xFFF5317F),
                      name: 'Bitcoin',
                      ticker: 'BTC',
                      value: '6730.49',
                      gain: '6.20',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FinanceContainer(
                      backgroundColor: Color(0xFF8739E5),
                      name: 'Etherium',
                      ticker: 'ETH',
                      value: '490.26',
                      gain: '18.05',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FinanceContainer(
                      backgroundColor: Color(0xFFE56336),
                      name: 'Litecoin',
                      ticker: 'LTC',
                      value: '130.31',
                      gain: '51.80',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FinanceContainer(
                      backgroundColor: Color(0xFF7DBD28),
                      name: 'Ripple',
                      ticker: 'XRP',
                      value: '0.49',
                      gain: '819k',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            )));
  }
}


