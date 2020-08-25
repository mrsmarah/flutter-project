//model for post data structure//

class Post {
  int id;
  int userId;
  String title;
  String body;
  Post(this.id, this.userId, this.title, this.body);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'userId' : userId,
      'title': title,
      'body': body,
    };
    return map;
  }

  Post.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    userId = map['userId'];
    title = map['title'];
    body = map['body'];
  }
}