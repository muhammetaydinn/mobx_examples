// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'todo_model.g.dart';

class Todo = _TodoBase with _$Todo;

abstract class _TodoBase with Store {
  @observable
  String description = '';
  
  @observable
  bool done = false;
  _TodoBase({
    required this.description,
  });

  
}
