import 'app_state.dart';

final appReducer = (AppState state, dynamic action) => state;

// AppState _onCreateTodoList(AppState state, CreateListAction action) {
//   print("Adding todo list ${action.listName}");
//   final todoList = TodoList(name: action.listName);
//   final newLists = List.from(state.todoLists).toList();
//   newLists.add(todoList);
//
//   return state.copyWith(todoLists: newLists);
// }
