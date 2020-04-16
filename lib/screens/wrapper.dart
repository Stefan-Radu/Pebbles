import 'package:flutter/material.dart';
import 'package:pebbles/screens/home/home.dart';
import 'package:pebbles/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:pebbles/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of < User >(context);

    if (user == null) {
      return Authenticate();
    }
    else {
      return Home(user);
    }
  }
}
