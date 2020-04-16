import 'package:flutter/material.dart';
import 'package:pebbles/services/auth.dart';

class SignIn extends StatefulWidget {

  SignIn({this.toggleView});

  final Function toggleView;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State < SignIn > {

  final AuthService authService = AuthService();
  final _formKey = GlobalKey < FormState >();

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
        title: Text('Sign in'),
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
                  validator: (val) => val.isEmpty ? 'Enter something' : null,
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
                      child: Text('Register'),
                      onPressed: () async {
                        widget.toggleView();
                      },
                    ),
                    RaisedButton(
                      color: Colors.green[300],
                      child: Text('Sign in'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic response = await authService.signInEmailAndPassword(email, password);
                          if (response == null) {
                            setState(() => error = 'Invalid credentials');
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
