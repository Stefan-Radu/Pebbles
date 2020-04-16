import 'package:flutter/material.dart';
import 'package:pebbles/models/pebble.dart';
import 'package:pebbles/models/user.dart';
import 'package:pebbles/services/database.dart';

class PebbleTile extends StatefulWidget {

  PebbleTile({this.pebble, this.user});

  final User user;
  final Pebble pebble;

  @override
  _PebbleTileState createState() => _PebbleTileState();
}

class _PebbleTileState extends State < PebbleTile > {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: < Widget > [
          ListTile(
            leading: Image.asset(widget.pebble.imgPath),
            title: Text(widget.pebble.title),
            subtitle: Text('Added by ${widget.pebble.userName}'),
            trailing: FlatButton.icon(
              icon: Icon(Icons.arrow_upward),
              label: Text('${widget.pebble.points}'),
              onPressed: () {
                setState(() async {
                  ++ widget.pebble.points;
                  await DatabaseService().updatePebblePoints(pebble: widget.pebble);
                });
              },
            ),
          ),
          Container(
            child: Text(widget.pebble.content),
          ),
        ],
      ),
    );
  }
}
