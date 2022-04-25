import 'package:flutter/material.dart';
import 'package:simple_todo_app/models/task.dart';

class TaskTile extends StatefulWidget {
  TaskTile({
    Key? key,
    required this.task,
    required this.onDeleted,
  }) : super(key: key);

  final Task task;
  final Function onDeleted;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    //final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const Color eventItemColor = Colors.lightBlue; //colorScheme.primary;
    //final Task item = widget._items[widget.itemIndex];

    return Material(
      child: AnimatedContainer(
        constraints: const BoxConstraints(minHeight: 60),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.task.finished ? Colors.grey : eventItemColor,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        child: Row(
          children: [
            Checkbox(
              key: widget.key,
              value: widget.task.finished,
              onChanged: (checked) {
                widget.task.finished = checked!;
                widget.task.save(); //업데이트. 저장해줌

                // setState(() {
                //   //widget.task.finished = checked ?? false;
                // });
              },
            ),
            Expanded(
              child: Text(
                widget.task.title.toString(),
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    decoration: widget.task.finished
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              onPressed: () { //=> widget.onDeleted(),
                widget.task.delete();
                widget.onDeleted();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
