import 'package:flutter/material.dart';
import 'package:pebbles/screens/authenticate/sign_in.dart';
import 'package:pebbles/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State < Authenticate > {

  bool _showSignIn = true;

  void toggleView() {
    setState(() => _showSignIn = !_showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    if (_showSignIn) {
      return SignIn(toggleView: toggleView);
    }
    else {
      return SignUp(toggleView: toggleView);
    }
  }
}
