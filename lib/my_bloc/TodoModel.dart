class TodoModel {
  int userId;
  int id;

  String title;
  bool completed;

  TodoModel(this.userId, this.id, this.title, this.completed);

  TodoModel.fromJson(dynamic json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userId"] = userId;
    map["id"] = id;
    map["title"] = title;
    map["completed"] = completed;

    return map;
  }
}
