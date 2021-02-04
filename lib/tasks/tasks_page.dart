import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';
import 'package:amazing_lists/tasks/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    Key key,
    @required this.projectId,
  }) : super(key: key);

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.from(store, projectId),
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
          onPressed: () => {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _ViewModel {
  _ViewModel(
    this.project, {
    @required this.onTapTaskCallback,
  });

  final Project project;
  final OnTapTaskCallback onTapTaskCallback;

  static _ViewModel from(Store<AppState> store, String projectId) => _ViewModel(
        store.state.projects.firstWhere((project) => project.id == projectId),
        onTapTaskCallback: (task) => store.dispatch(ToggleTaskCompleteAction(projectId: projectId, taskId: task.id)),
      );
}
