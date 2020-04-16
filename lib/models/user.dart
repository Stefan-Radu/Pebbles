import 'package:pebbles/services/database.dart';

class User {

  User({this.uid}) {
    DatabaseService().getUserInstance(uid:this.uid).then((document) {
      this.userName = document['userName'];
      this.email = document['email'];
      this.markedPebbles = Map.from(document['markedPebbles']);
    });
  }

  final String uid;
  String userName;
  String email;
  Map < String, int > markedPebbles;
}
