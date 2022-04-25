# ReorderableListView
- onReorder: 위치를 변경할 때마다 index도 제 위치로 변경한다.
```
Widget _taskList(){
    return ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        
        proxyDecorator: (Widget child, int index, Animation<double> animation) {
            return //List content Widget
        },
        
        children: <Widget>[
            for(int index = 0; index < _items.length; index +=1 )
            Padding(
                key: Key('${index}'),
                padding: const EdgeInsets.all(8),
                child: //List content Widget
            ),
        ],
        
        //위치 재조정
        onReorder: (int oldIndex, int newIndex){
            setState((){
                if(oldIndex < new Index){
                    newIndex -= 1;
                }
                final Task item = _items.removeAt(oldIndex);
                _items.insert(newIndex, item);
            });
        },
    );
}
```

<br><br>

- item
```
const eventItemColor = Colors.lightBlue;
final Task item = widget._items[widget.itemIndex];

return Material(
    child: AnimatedContainer(
        constraints: const BoxConstraints(minHeight: 60),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: item.finished ? Colors.grey, : eventItemColor,
            borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        child: Row(
            children: [
                Checkbox(
                    key: widget.key,
                    value: item.finished,
                    onChanged: (checked){
                        setState((){
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
                            : TextDecoration.none
                        ),
                    ),
                ),
                IconButton(
                    padding: const EdgeInsets.only(right: 20),
                    onPressed: ()=>widget.onDeleted(),
                    icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                    ),
                )
            ],
        ),
    ),
);
```