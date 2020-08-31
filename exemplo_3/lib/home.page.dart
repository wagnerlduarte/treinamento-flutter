import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _infoText = 'Informe seus dados!';

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _refresh() {
    weightController.text = '';
    heightController.text = '';

    setState(() {
      _infoText = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Calculadora de IMC'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      size: 100,
                      color: Colors.green,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Peso (kg)',
                          labelStyle: TextStyle(
                            color: Colors.green,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira sua altura!';
                        }
                        return null;
                      },
                      controller: weightController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Altura (cm)',
                          labelStyle: TextStyle(
                            color: Colors.green,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira seu peso!';
                        }
                        return null;
                      },
                      controller: heightController,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            _calculate();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44,
                          child: Center(
                            child: Text(
                              'Calcular',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      _infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
