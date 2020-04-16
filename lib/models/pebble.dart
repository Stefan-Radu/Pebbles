class Pebble {

  Pebble({this.uid, this.timeStamp, this.userName, this.title,
    this.content, this.category, this.points = 0}) {

    if (points == 0) {
      imgPath = 'assets/coal.png';
    }
    else {
      imgPath = 'assets/amethyst.png';
    }
  }

  final String uid;
  final int timeStamp;
  final String userName;
  String title;
  String content;
  String category;
  int points;
  String imgPath;
}
