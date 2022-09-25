class Task {
  int? id;
  String? title;
  String? date;
  String? time;

  Task({this.id, this.title, this.date, this.time});

  Map<String, dynamic> toMap(){
    return {'id': id, 'title': title, 'date': date, 'time': time};
  }
}