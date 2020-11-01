import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/Wrapper_screen.dart';
import 'package:haya/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _checked = false;
  final _key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Map<String, String> _credentials = {};

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
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'APP LOGO',
                                style: TextStyle(fontSize: 52),
                              )),
                          SizedBox(height: 50),
                          Text(
                              'Please provide your credentials to access our services.'),
                          SizedBox(height: 10),
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
                            validator: (value) => value.length > 6
                                ? null
                                : 'Please enter a strong password.',
                            decoration: _buildInputDecoration(
                                'Password', Icons.lock_outline),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: lightBlueColor,
                                    value: _checked,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _checked = value;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _checked = !_checked;
                                      });
                                    },
                                    child: Text('Keep me logged in'),
                                  ),
                                ],
                              ),
                              FlatButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text('Sorry for you lol.'),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 25),
                          RaisedButton.icon(
                            icon: Icon(Icons.chevron_right),
                            color: lightBlueColor,
                            colorBrightness: Brightness.light,
                            onLongPress: () => Navigator.of(context)
                                .pushReplacementNamed(WrapperScreen.routeName),
                            onPressed: () async {
                              if (_key.currentState.validate()) {
                                _key.currentState.save();

                                // Saving text field content into the map
                                _credentials['email'] =
                                    emailController.text.toString().trim();
                                _credentials['password'] =
                                    passwordController.text;

                                // todo authentification with middleware.

                                //showing alert dialog or something to the user
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Success'),
                                    content: Text('Successfully logged in.' +
                                        passwordController.text),
                                  ),
                                );
                              }
                            },
                            label: Text('Login'),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed(
                                      RegisterScreen.routeName),
                              child: Text(
                                'Create a new account.',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          )
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
}
