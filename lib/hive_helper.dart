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

  //insert기능이 없어서 만든다.
  //TaskBox안에있는 모든 데이터를 캐시쪽으로 가져올것이다.
  //1개의 key에는 1개의 박스만 들어간다.
  Future<void> reorder(int oldIndex, int newIndex) async{
    List<Task> newList = [];
    newList.addAll(tasksBox!.values);

    final Task item = newList.removeAt(oldIndex);
    newList.insert(newIndex, item);
    await tasksBox!.clear();
    await tasksBox!.addAll(newList);
    //return;
  }

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