import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Join our community',
                            style: TextStyle(fontSize: 52),
                          ),
                          SizedBox(height: 30),
                          Text("Please fill this form with your informations."),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) => value.isNotEmpty
                                ? null
                                : 'Please type your name.',
                            decoration: _buildInputDecoration(
                                'Full Name', Icons.person_outline),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) => value.length == 8
                                ? null
                                : 'Please type a valid phoneNumber.',
                            decoration: _buildInputDecoration(
                                'Phone number', Icons.phone),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => value.contains('@')
                                ? null
                                : 'Please enter a valid Email address.',
                            decoration: _buildInputDecoration(
                                'Email', Icons.alternate_email),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            validator: (value) => value.length >= 6
                                ? null
                                : 'Please enter a strong password.',
                            decoration: _buildInputDecoration(
                                'Password', Icons.lock_outline),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: confirmPasswordController,
                            validator: (value) =>
                                value == passwordController.text.toString()
                                    ? null
                                    : "The passwords don't match.",
                            decoration: _buildInputDecoration(
                                'Confirm password', Icons.lock),
                          ),
                          SizedBox(height: 20),
                          RaisedButton.icon(
                            icon: Icon(Icons.arrow_forward),
                            color: lightBlueColor,
                            onPressed: () {
                              if (_key.currentState.validate())
                                _key.currentState.save();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Success'),
                                  content: Text(
                                      'Your account has been successfully created.' +
                                          _key.currentState.toString()),
                                ),
                              );
                            },
                            label: Text('Create account'),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName),
                              child: Text(
                                'Login instead.',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

InputDecoration _buildInputDecoration(String hint, IconData icon) {
  return InputDecoration(
    labelText: hint,
    filled: true,
    prefixIcon: Icon(icon),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    // fillColor: Colors.cyan,
    border: new OutlineInputBorder(
      borderSide: new BorderSide(),
    ),
  );
}
