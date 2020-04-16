import 'package:flutter/material.dart';
import 'package:pebbles/services/auth.dart';
import 'package:pebbles/models/user.dart';
import 'package:pebbles/widgets/new_pebble_dialog.dart';
import 'package:pebbles/services/database.dart';
import 'package:provider/provider.dart';
import 'package:pebbles/widgets/pebble_list.dart';
import 'package:pebbles/models/pebble.dart';

class Home extends StatelessWidget {

  Home(this.user);

  final User user;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider < List < Pebble > >.value(
      value: DatabaseService().pebbles,
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: < Widget > [
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        'Pebbles',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Log out'),
                    onTap: () async {
                      await authService.signOut();
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text('Pebbles'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'My pebbles'),
                  Tab(icon: Icon(Icons.explore), text: 'Browse pebbles'),
                ],
              ),
            ),
            body: TabBarView(
              children: < Widget > [
                Center(
                  child: Text('my pebbles'),
                ),
                PebbleList(user: user),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: Text('New Pebble'),
              icon: Icon(Icons.add),
              onPressed: () {
                newPebbleDialog(user, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
