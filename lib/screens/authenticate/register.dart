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
  String userName = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, 
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Register'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: < Widget > [
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your user name',
                    labelText: 'User Name *',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter a valid user name' : null,
                  onChanged: (val) => userName = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Enter your email address',
                    labelText: 'Email *',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter a valid email address' : null,
                  onChanged: (val) => email = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Enter password',
                    labelText: 'Password *',
                  ),
                  obscureText: true,
                  validator: (val) =>
                    val.length < 8 ? 'Password must be at least 8 characters long' : null,
                  onChanged: (val) => password = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Confirm your password',
                    labelText: 'Confirm password *',
                  ),
                  obscureText: true,
                  validator: (val) => val != password ? 'Passwords don\'t match' : null, 
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
                      child: Text('Register'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic response = await authService
                              .signUpEmailAndPassword(userName, email, password);
                          if (response == null) {
                            setState(() => error = 'Data provided invalid or unavailable');
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
