import 'package:amazing_lists/model/todo.dart';
import 'package:amazing_lists/model/todo_list.dart';

class AddTodoListAction {
  final TodoList todoList;

  AddTodoListAction(this.todoList);
}

class DeleteTodoListAction {
  final TodoList todoList;

  DeleteTodoListAction(this.todoList);
}

class AddTodoAction {
  final TodoList todoList;
  final Todo todo;

  AddTodoAction(this.todoList, this.todo);
}
