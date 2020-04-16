import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pebbles/models/pebble.dart';

class DatabaseService {

  // user collection
  final CollectionReference userCollection = Firestore.instance.collection('users');

  // pebbles collection
  final CollectionReference pebbleCollection = Firestore.instance.collection('pebbles');

  // create new pebble
  Future createPebble({String userName, String title, String content, String category}) async {
    return await pebbleCollection.add({
      'timeStamp': DateTime.now().millisecondsSinceEpoch,
      'userName': userName,
      'title': title,
      'content': content,
      'category': category,
      'points': 0,
    }).catchError((e) {
      print('could\'t create pebble');
      print(e.toString());
      return null;
    });
  }

  // get pebble List 
  List < Pebble > _pebbleListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pebble(
        uid: doc.documentID,
        timeStamp: doc.data['timeStamp'],
        userName: doc.data['userName'],
        title: doc.data['title'],
        content: doc.data['content'],
        category: doc.data['category'],
        points: doc.data['points']
      );
    }).toList();
  }

  // pebble listener
  Stream < List < Pebble > > get pebbles {
    return pebbleCollection.orderBy('points', descending: true).snapshots().map(_pebbleListFromSnapshot);
  }

  // change pebble
  Future updatePebblePoints({Pebble pebble}) async {
    return await pebbleCollection.document(pebble.uid).updateData({
      'points': pebble.points,
    }).catchError((e) {
      print('could\'t update points');
      print(e.toString());
      return null;
    });
  }

  // create user instance
  Future createUserInstance({ String uid, String userName, String email }) async {
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
