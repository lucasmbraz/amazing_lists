import 'package:flutter_todo/model/todo_list.dart';

class AddTodoListAction {
  final TodoList todoList;

  AddTodoListAction(this.todoList);
}

class DeleteTodoListAction {
  final TodoList todoList;

  DeleteTodoListAction(this.todoList);
}
