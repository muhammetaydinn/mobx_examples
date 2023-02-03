import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_examples/Todo/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);
//TODO: neden filter nullchech
    return Column(children: <Widget>[
      Observer(
        builder: (_) => Column(
          children: <Widget>[
            RadioListTile(
                dense: true,
                title: const Text('All'),
                value: VisibilityFilter.all,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!),
            RadioListTile(
                dense: true,
                title: const Text('Pending'),
                value: VisibilityFilter.pending,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!),
            RadioListTile(
                dense: true,
                title: const Text('Completed'),
                value: VisibilityFilter.completed,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!),
          ],
        ),
      ),
      Observer(
          builder: (_) => ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Remove Completed'),
                    onPressed: list.canRemoveAllCompleted
                        ? list.removeCompleted
                        : null,
                  ),
                  ElevatedButton(
                    child: const Text('Mark All Completed'),
                    onPressed: list.canMarkAllCompleted
                        ? list.markAllAsCompleted
                        : null,
                  )
                ],
              ))
    ]);
  }
}
