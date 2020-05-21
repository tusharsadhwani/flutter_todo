import 'package:flutter/material.dart';

import './todo_item.dart';
import '../../classes/todos.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todos = Todos();
  final nodes = List<FocusNode>();
  var focusedNodeIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (todos.todoList.length > nodes.length) {
      for (var i = nodes.length; i < todos.todoList.length; i++) {
        nodes.add(FocusNode());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
      ),
      body: ReorderableListView(
        onReorder: (prevPos, newPos) => (setState(
          () => todos.reorderTodo(prevPos, newPos),
        )),
        children: List.generate(
          todos.todoList.length,
          (int index) => TodoItem(
            todos.todoList[index],
            key: ValueKey(index),
            focusNode: nodes[index],
            focused: index == focusedNodeIndex,
            checkItem: (bool value) =>
                setState(() => todos.checkItem(index, value)),
            updateText: (String value) =>
                setState(() => todos.updateText(index, value)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() {
          int index = todos.newItem();
          setState(() {
            focusedNodeIndex = index;
          });
        }),
      ),
    );
  }
}
