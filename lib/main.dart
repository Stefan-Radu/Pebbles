import 'package:flutter/material.dart';
import 'package:pebbles/screens/wrapper.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(), 
    );
  }
}
