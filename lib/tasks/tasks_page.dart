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
          tasks: vm.project.tasks,
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
  _ViewModel(
    this.project, {
    @required this.onAddTaskCallback,
    @required this.onTapTaskCallback,
  });

  final Project project;
  final OnAddTaskCallback onAddTaskCallback;
  final OnTapTaskCallback onTapTaskCallback;

  static _ViewModel from(Store<AppState> store, Uuid uuid, String projectId) => _ViewModel(
        store.state.projects.firstWhere((project) => project.id == projectId),
        onAddTaskCallback: (taskName) =>
            store.dispatch(AddTaskAction(projectId: projectId, task: Task(id: uuid.v4(), name: taskName, complete: false))),
        onTapTaskCallback: (task) => store.dispatch(ToggleTaskCompleteAction(projectId: projectId, taskId: task.id)),
      );
}
