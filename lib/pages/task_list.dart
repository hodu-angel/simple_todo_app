import 'package:flutter/material.dart';
import 'package:simple_todo_app/models/task.dart';

class TaskTile extends StatefulWidget {
  TaskTile(
    this._items, {
    Key? key,
    required this.itemIndex,
    required this.onDeleted,
  }) : super(key: key);

  final int itemIndex;
  final Function onDeleted;
  final List<Task> _items;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    //final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const Color eventItemColor = Colors.lightBlue; //colorScheme.primary;
    final Task item = widget._items[widget.itemIndex];

    return Material(
      child: AnimatedContainer(
        constraints: const BoxConstraints(minHeight: 60),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: item.finished ? Colors.grey : eventItemColor,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        child: Row(
          children: [
            Checkbox(
              key: widget.key,
              value: item.finished,
              onChanged: (checked) {
                setState(() {
                  item.finished = checked ?? false;
                });
              },
            ),
            Expanded(
              child: Text(
                item.title.toString(),
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    decoration: item.finished
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              onPressed: () => widget.onDeleted(),
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
