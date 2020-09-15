import 'package:exercicio_5/register.model.dart';
import 'package:flutter/material.dart';

class VerificationPageArguments {
  final RegisterModel registerModel;

  VerificationPageArguments(this.registerModel);
}

class VerificationPage extends StatefulWidget {
  final VerificationPageArguments args;

  VerificationPage(this.args);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print('Full Name: ${widget.args.registerModel.fullName}');
    print('Email Address: ${widget.args.registerModel.email}');
    print('Mobile Number: ${widget.args.registerModel.phoneNumber}');
    print('Contry: ${widget.args.registerModel.country}');
    print('Password: ${widget.args.registerModel.password}');
    print('Confirm Password: ${widget.args.registerModel.confirmPassword}');
    print('Referral Code: ${widget.args.registerModel.referralCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: new IconButton(
          color: Colors.black,
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Verification',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Text(
                        'a four digit verification code has been sent to your mobile number'),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                      color: Color(0xFFE83F3F),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          () => {};
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFE83F3F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
