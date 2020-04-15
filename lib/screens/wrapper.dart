import 'package:flutter/material.dart';
import 'package:pebbles/screens/home/home.dart';
import 'package:pebbles/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return home or authenticate
    return Authenticate();
    // return Home();
  }
}
