import 'package:flutter/material.dart';
import 'package:pebbles/services/auth.dart';
import 'package:pebbles/models/user.dart';

class Home extends StatelessWidget {

  Home(this.user);

  final User user;
  final AuthService _authService = AuthService(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Home'),
          actions: < Widget > [
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _authService.signOut();
              },
              label: Text('log out'),
            ),
          ],
        ),
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
