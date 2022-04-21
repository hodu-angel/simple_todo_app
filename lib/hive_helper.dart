import 'package:hive/hive.dart';
import 'package:simple_todo_app/models/task.dart';

class HiveHelper{
  static final HiveHelper _singleton = HiveHelper._internal();
  factory HiveHelper(){
    return _singleton;
  }
  HiveHelper._internal();

  Box<Task>? tasksBox;
}