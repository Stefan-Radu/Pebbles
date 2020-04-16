class Pebble {

  Pebble(this.uid, this.timeStamp, this.userUid, this.userName, {this.title = '', this.content = ''}) {
    this.points = 0;
  }

  final String uid;
  final int timeStamp;
  final String userUid;

  String title;
  String content;
  String userName;
  int points;
}
