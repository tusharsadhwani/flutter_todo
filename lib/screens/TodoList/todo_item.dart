import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final Map<String, dynamic> data;
  final FocusNode focusNode;
  final bool focused;
  final Function checkItem;
  final Function updateText;

  TodoItem(this.data,
      {this.checkItem, this.updateText, this.focusNode, this.focused});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.data['title']);
    if (widget.focused) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.focusNode.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.data['checked'],
      title: TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        onChanged: widget.updateText,
      ),
      onChanged: (value) => widget.checkItem(value),
    );
  }
}
