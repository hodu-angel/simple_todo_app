class Task {
  // final String? title;
  // bool finished;
  //
  // Task({
  //   this.title,
  //   this.finished = false,
  // });

  final String _id;
  final String _title;
  bool finished;

  String get id => _id;

  String get title => _title;

  Task({
    required String title,
  })  : finished = false,
        _id = DateTime.now().millisecondsSinceEpoch.toString(),
        _title = title;

  Task.fromJson(dynamic json)
      : _id = json['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
        _title = json['title'] ?? '',
        finished = json['finished'] ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = title;
    map['finished'] = finished;
    return map;
  }
}
