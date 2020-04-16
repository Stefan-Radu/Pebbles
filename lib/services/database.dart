import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  // user collection
  final CollectionReference userCollection = Firestore.instance.collection('users');

  // TODO pebbles collection

  // create user instance
   createUserInstance({ String uid, String userName, String email }) async {
    return await userCollection.document(uid).setData({
      'uid': uid,
      'userName': userName,
      'email': email,
      'markedPebbles': {},
    }).catchError((e) {
      print('could\'t create user instance');
      print(e.toString());
      return null;
    });
  }

  // get user instance
  Future getUserInstance({ String uid }) async {
    return await userCollection.document(uid).get()
      .then((DocumentSnapshot document) => document.data)
      .catchError((e) {
        print('could\'t create user instance');
        print(e.toString());
    });
  }
}
