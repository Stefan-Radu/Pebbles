import 'package:flutter/material.dart';
import 'package:pebbles/services/database.dart';
import 'package:pebbles/models/user.dart';

Future < bool > newPebbleDialog(User user, BuildContext context) async {

  final _formKey = GlobalKey<FormState>();

  String title = '';
  String content = '';
  String category = 'Activity';

  return showDialog( 
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Create a new pebble'),
            content: ListView(
              shrinkWrap: true,
              children: < Widget > [
                Form(
                  key: _formKey,
                  child: Column(
                    children: < Widget > [
                      TextFormField(
                        maxLength: 27,
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.title),
                          hintText: 'Title',
                        ),
                        validator: (val) => val.isEmpty ? 'Enter something' : null,
                        onChanged: (val) =>  title = val,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 315,
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.format_quote),
                          hintText: 'Some content',
                        ),
                        validator: (val) => val.isEmpty ? 'Enter something' : null,
                        onChanged: (val) => content = val,
                      ),
                      DropdownButtonFormField < String > (
                        decoration: InputDecoration(
                          icon: Icon(Icons.category),
                          labelText: 'Category',
                          border: InputBorder.none,
                        ),
                        value: category,
                        icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        onChanged: (value) => setState(() => category = value),
                        items: < String > ['Activity', 'Everyday tip', 'Inspiration']
                        .map < DropdownMenuItem < String > > ((String value) => 
                          DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: < Widget > [
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text('Add'),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService().createPebble(
                            userName: user.userName,
                            title: title,
                            content: content,
                            category: category
                          );
                          Navigator.of(context).pop(true);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          );
        },
      );
    }
  );
}
