import 'package:flutter/material.dart';

import 'form_field.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() {}

  _goToRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    MyFormField(
                      controller: emailController,
                      isRequired: true,
                      label: 'Email Address',
                      errorMessage: 'Email Address is required',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    MyFormField(
                      controller: passwordController,
                      isRequired: true,
                      label: 'Password',
                      errorMessage: 'Password is required',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () => _goToRegister(context),
                        child: Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    RaisedButton(
                        color: Color(0xFFE83F3F),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _login();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
