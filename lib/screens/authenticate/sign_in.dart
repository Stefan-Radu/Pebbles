import 'package:flutter/material.dart';
import 'package:pebbles/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  SingInState createState() => SingInState();
}

class SingInState extends State < SignIn > {

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Sign in'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: RaisedButton(
            child: Text('Sign in anonymously'),
            onPressed: () async {
              dynamic result = await authService.signInAnon();
              if (result == null) {
                print('couldn\'t sing in');
              }
              else {
                print('signed in');
                print(result.toString());
              }
            }
          ),
        ),
      ),
    );
  }
}
