import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pebbles/models/pebble.dart';
import 'package:pebbles/models/user.dart';
import 'package:pebbles/widgets/pebble_tile.dart';

class PebbleList extends StatefulWidget {

  PebbleList({this.user});

  final User user;

  @override
  _PebbleListState createState() => _PebbleListState();
}

class _PebbleListState extends State < PebbleList > {
  @override
  Widget build(BuildContext context) {

    final pebbles = Provider.of < List < Pebble > > (context);

    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: pebbles.length,
      itemBuilder: (context, index) {
        return PebbleTile(pebble: pebbles[index], user: widget.user);
      }
    );
  }
}
