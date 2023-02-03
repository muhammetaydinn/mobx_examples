import 'package:flutter/material.dart';
import 'package:mobx_examples/Dice/dice_view.dart';

import 'Todo/view/todo_view.dart';

class Example {
  Example(
      {required this.title,
      required this.description,
      required this.path,
      required this.widgetBuilder});

  final WidgetBuilder widgetBuilder;
  final String path;
  final String title;

  final String description;
}

final List<Example> examples = [
  Example(
    title: 'Todos',
    description: 'Managing a list of Todos, the TodoMVC way.',
    path: '/todos',
    widgetBuilder: (_) =>  TodoView(),
  ),

  Example(
    title: 'Dice',
    description: 'A Fun Dice app.',
    path: '/dice',
    widgetBuilder: (_) =>  DiceView(),
  ),
];
