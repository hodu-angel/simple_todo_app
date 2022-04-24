import 'package:hive/hive.dart';
import 'package:simple_todo_app/models/task.dart';

const String TASK_BOX = 'TASK_BOX';

class HiveHelper {
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

  Future create(Task newTask) async {
    return tasksBox!.add(newTask);
  }

  Future<List<Task>> read() async {
    return tasksBox!.values.toList();
  }

  Future update(int index, Task updatedTask) async {
    tasksBox!.putAt(index, updatedTask);
  }

  Future delete(int index) async {
    tasksBox!.deleteAt(index);
  }


}