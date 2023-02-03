import 'package:flutter/material.dart';
import 'package:mobx_examples/Todo/viewmodel/todo_view_model.dart';
import 'package:mobx_examples/Todo/view/add_todo_view.dart';
import 'package:mobx_examples/Todo/view/todo_list_view.dart';
import 'package:provider/provider.dart';

import 'action_bar_view.dart';
import 'description_view.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<TodoList>(
      create: (context) => TodoList(),
      //builder: (_) => TodoList(),
      //TODO: neden builder yerine create kullanıyoruz?
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          body: Column(
            children: <Widget>[
              AddTodo(),
              ActionBar(),
              Description(),
              TodoListView()
            ],
          )));
}
