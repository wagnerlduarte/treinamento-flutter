import 'package:flutter/material.dart';

import 'form_field.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  void _clearForm() {
    fullNameController.text = '';
    emailController.text = '';
    phoneNumberController.text = '';
    countryController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    referralCodeController.text = '';

    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _register() {
    print('Full Name: ' + fullNameController.text);
    print('Email Address: ' + emailController.text);
    print('Mobile Number: ' + phoneNumberController.text);
    print('Country: ' + countryController.text);
    print('Password: ' + passwordController.text);
    print('Confirm Password: ' + confirmPasswordController.text);
    print('Referral Code: ' + referralCodeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          RaisedButton(
              onPressed: _clearForm,
              color: Colors.white,
              elevation: 0,
              child: Text(
                'Clear',
                style: TextStyle(
                  color: Color(0xFFE83F3F),
                  fontStyle: FontStyle.italic,
                ),
              )),
        ],
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
                        'Register',
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
                      controller: fullNameController,
                      isRequired: true,
                      label: 'Full Name',
                      errorMessage: 'Full Name is required',
                      capitalization: TextCapitalization.words,
                    ),
                    MyFormField(
                      controller: emailController,
                      isRequired: true,
                      label: 'Email Address',
                      errorMessage: 'Email Address is required',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    MyFormField(
                      controller: phoneNumberController,
                      isRequired: true,
                      label: 'Mobile Number',
                      errorMessage: 'Mobile Number is required',
                      keyboardType: TextInputType.phone,
                    ),
                    MyFormField(
                      controller: countryController,
                      isRequired: true,
                      label: 'Country',
                      errorMessage: 'Country is required',
                      capitalization: TextCapitalization.words,
                      keyboardType: TextInputType.streetAddress,
                    ),
                    MyFormField(
                      controller: passwordController,
                      isRequired: true,
                      label: 'Password',
                      errorMessage: 'Password is required',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    MyFormField(
                      controller: confirmPasswordController,
                      isRequired: true,
                      label: 'Confirm Password',
                      errorMessage: 'Confirm Password is required',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    MyFormField(
                      controller: referralCodeController,
                      label: 'Referral Code (Optional)',
                      errorMessage: 'Referral Code (Optional) is required',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                        color: Color(0xFFE83F3F),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _register();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Registry',
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
