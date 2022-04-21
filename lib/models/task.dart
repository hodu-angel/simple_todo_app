// class Task {
//   // final String? title;
//   // bool finished;
//   //
//   // Task({
//   //   this.title,
//   //   this.finished = false,
//   // });
//
//   final String _title;
//   bool finished;
//
//   String get title => _title;
//
//   Task({
//     required String title,
//   })  : finished = false,
//         _title = title;
//
//   Task.fromJson(dynamic json)
//       : _title = json['title'] ?? '',
//         finished = json['finished'] ?? false;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['title'] = title;
//     map['finished'] = finished;
//     return map;
//   }
// }

//hive로 변환
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{
  @HiveField(0)
  final String? title;
  @HiveField(1)
  bool finished;

  Task({this.title, this.finished = false});
}