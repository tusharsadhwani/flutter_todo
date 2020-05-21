import 'package:flutter/material.dart';

import './screens/TodoList/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF202239),
        scaffoldBackgroundColor: Color(0xFF202239),
        canvasColor: Color(0xFF202239),
      ),
      title: 'TodoList',
      home: TodoList(),
    );
  }
}
