import 'package:flutter/material.dart';
import 'package:pebbles/screens/wrapper.dart';
import 'package:pebbles/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:pebbles/models/user.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider < User >.value (
      value: AuthService().userAuthState,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
