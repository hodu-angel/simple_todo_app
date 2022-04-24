import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_app/hive_helper.dart';
import 'package:simple_todo_app/home.dart';
import 'package:simple_todo_app/models/task.dart';

void main() async{
  await Hive.initFlutter();
  //어댑터를 레지스터에 등록
  Hive.registerAdapter(TaskAdapter());
  await HiveHelper().openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}