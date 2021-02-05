import 'package:amazing_lists/add_task/add_project_dialog.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';
import 'package:amazing_lists/tasks/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

class TasksPage extends StatelessWidget {
  final uuid = Uuid();

  TasksPage({
    Key key,
    @required this.projectId,
  }) : super(key: key);

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.from(store, uuid, projectId),
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          title: Text(vm.project.name),
        ),
        body: TasksWidget(
          tasks: vm.tasks,
          onTapCallback: vm.onTapTaskCallback,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => _openAddTaskDialog(context, vm),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _openAddTaskDialog(BuildContext context, _ViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AddTaskDialog(vm.onAddTaskCallback),
    );
  }
}

class _ViewModel {
  _ViewModel({
    @required this.project,
    @required this.tasks,
    @required this.onAddTaskCallback,
    @required this.onTapTaskCallback,
  });

  final Project project;
  final List<Task> tasks;
  final OnAddTaskCallback onAddTaskCallback;
  final OnTapTaskCallback onTapTaskCallback;

  static _ViewModel from(Store<AppState> store, Uuid uuid, String projectId) => _ViewModel(
        project: store.state.projects[projectId],
        tasks: store.state.tasks.values.where((task) => task.projectId == projectId).toList(),
        onAddTaskCallback: (taskName) => store.dispatch(AddTaskAction(Task(id: uuid.v4(), name: taskName, complete: false, projectId: projectId))),
        onTapTaskCallback: (task) => store.dispatch(ToggleTaskCompleteAction(taskId: task.id)),
      );
}
