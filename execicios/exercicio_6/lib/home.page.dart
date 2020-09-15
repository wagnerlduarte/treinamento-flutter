import 'package:exercicio_6/button.component.dart';
import 'package:exercicio_6/color.utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstNumber = '';
  String secondNumber = '';
  String operator = '';
  String result = '';

  _numberAction(value) {
    setState(() {
      this.result += '${value}';
    });
  }

  _clear(value) {
    setState(() {
      this.firstNumber = '';
      this.secondNumber = '';
      this.operator = '';
      this.result = '';
    });
  }

  _setOperation(value) {
    setState(() {
      this.firstNumber = result;
      this.secondNumber = '';
      this.operator = value;
      this.result = '';
    });
  }

  _equals(value) {
    setState(() {
      this.secondNumber = this.result;
      double result;
      double firstNumber =
          double.tryParse(this.firstNumber.replaceAll(',', '.'));
      double secondNumber =
          double.tryParse(this.secondNumber.replaceAll(',', '.'));

      switch (this.operator) {
        case '÷':
          result = double.tryParse(this.firstNumber) /
              double.tryParse(this.secondNumber);
          break;
        case 'x':
          result = double.tryParse(this.firstNumber) *
              double.tryParse(this.secondNumber);
          break;
        case '–':
          result = double.tryParse(this.firstNumber) -
              double.tryParse(this.secondNumber);
          break;
        case '+':
          result = firstNumber + secondNumber;
          break;
        default:
          result = 0.0;
      }

      String stringResult = result.toString();

      this.result = (stringResult.endsWith('.0')
              ? stringResult.split('.')[0]
              : stringResult)
          .replaceAll('.', ',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AutoSizeText(
                          this.result,
                          minFontSize: 30,
                          maxFontSize: 94,
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 94, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(
                      label: 'AC',
                      action: _clear,
                      backgroundColor: ColorUtils.grey,
                      textColor: Colors.black,
                    ),
                    Button(
                      label: '+/-',
                      backgroundColor: ColorUtils.grey,
                      textColor: Colors.black,
                    ),
                    Button(
                      label: '%',
                      backgroundColor: ColorUtils.grey,
                      textColor: Colors.black,
                    ),
                    Button(
                      label: '÷',
                      action: _setOperation,
                      backgroundColor: ColorUtils.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(label: '7', action: _numberAction),
                    Button(label: '8', action: _numberAction),
                    Button(label: '9', action: _numberAction),
                    Button(
                      label: 'x',
                      action: _setOperation,
                      backgroundColor: ColorUtils.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(label: '4', action: _numberAction),
                    Button(label: '5', action: _numberAction),
                    Button(label: '6', action: _numberAction),
                    Button(
                      label: '–',
                      action: _setOperation,
                      backgroundColor: ColorUtils.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(label: '1', action: _numberAction),
                    Button(label: '2', action: _numberAction),
                    Button(label: '3', action: _numberAction),
                    Button(
                      label: '+',
                      action: _setOperation,
                      backgroundColor: ColorUtils.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(
                      label: '0',
                      flex: 2,
                      action: _numberAction,
                    ),
                    Button(
                      label: ',',
                      action: _numberAction,
                    ),
                    Button(
                      label: '=',
                      action: _equals,
                      backgroundColor: ColorUtils.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
