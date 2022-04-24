import 'package:hive/hive.dart';
import 'package:simple_todo_app/models/task.dart';

const String TASK_BOX = 'TASK_BOX';

class HiveHelper{
  static final HiveHelper _singleton = HiveHelper._internal();
  factory HiveHelper(){
    return _singleton;
  }
  HiveHelper._internal();



  Box<Task>? tasksBox;

  //박스에 담을 준비
  Future openBox() async {
    tasksBox = await Hive.openBox(TASK_BOX);
  }
}