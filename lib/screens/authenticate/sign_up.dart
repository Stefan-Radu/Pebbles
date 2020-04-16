import 'package:flutter/material.dart';
import 'package:pebbles/services/auth.dart';

class SignUp extends StatefulWidget {

  SignUp({this.toggleView});

  final Function toggleView;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State < SignUp > {

  final _formKey = GlobalKey < FormState >();
  final AuthService authService = AuthService();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, 
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Sign up'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: < Widget > [
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Enter your email address',
                    labelText: 'Email *',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter somthing' : null,
                  onChanged: (val) => email = val,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Enter password',
                    labelText: 'Password *',
                  ),
                  obscureText: true,
                  validator: (val) =>
                    val.length < 8 ? 'Password must be at least 8 characters long' : null,
                  onChanged: (val) => password = val,
                ),
                SizedBox(height: 20),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Row(
                  children: < Widget > [
                    FlatButton(
                      child: Text('Sign in'),
                      onPressed: () async {
                        widget.toggleView();
                      },
                    ),
                    RaisedButton(
                      color: Colors.green[300],
                      child: Text('Sign up'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic response = await authService.signUpEmailAndPassword(email, password);
                          if (response == null) {
                            setState(() => error = 'Invalid data');
                          }
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
