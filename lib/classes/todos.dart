class Todos {
  List<Map<String, dynamic>> _todoList = [
    {'title': "Make Todo App", 'checked': false},
    {'title': "Test 1", 'checked': true},
    {'title': "Lol", 'checked': false},
  ];
  List<Map<String, dynamic>> get todoList {
    return _todoList;
  }

  void checkItem(int index, bool value) {
    _todoList[index]['checked'] = value;
  }

  int newItem() {
    _todoList.add({'title': "", 'checked': false});
    return _todoList.length - 1;
  }

  void updateText(int index, String value) {
    print("updating text to $value");
    _todoList[index]['title'] = value;
  }

  void reorderTodo(int prevPos, int newPos) {
    if (newPos > prevPos) newPos -= 1;
    final todo = _todoList.removeAt(prevPos);
    _todoList.insert(newPos, todo);
  }
}
