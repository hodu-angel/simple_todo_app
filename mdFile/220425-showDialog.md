# showDialog
```
...
Future<void> _showDialog() async{
    return showDialog<void>(
        context: context,
        builder: (BuildContext context){
        //dialog 종류 적는 곳.
            return AlertDialog(
                title: const Text('할 일 추가'),
                context: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: '내용을 입력하세요',
                    ),
                    onSubmitted: (String text){
                        setState((){
                            ...
                        });
                        Naivgator.of(context).pop();
                    },
                    //키보드에서 엔터부분
                    textInputAction: TextInputAction.send,
                ),
            );
        }
    );
}
```