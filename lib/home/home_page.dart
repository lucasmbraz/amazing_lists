import 'package:amazing_lists/add_project/add_project_dialog.dart';
import 'package:amazing_lists/home/project_item_widget.dart';
import 'package:amazing_lists/home/projects_widget.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/tasks/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatelessWidget {
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.from(context, store, uuid),
        builder: (context, vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text('TODO'),
            ),
            body: _body(vm),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => _openAddTodoListDialog(context, vm),
              child: const Icon(Icons.add),
            ),
          );
        });
  }

  Widget _body(_ViewModel vm) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ProjectsWidget(
            projects: vm.projects,
            onTapCallback: vm.onTapProjectCallback,
          ),
        ),
      ),
    );
  }

  _openAddTodoListDialog(BuildContext context, _ViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AddProjectDialog(vm.onAddProjectCallback),
    );
  }
}

class _ViewModel {
  _ViewModel({
    @required this.projects,
    @required this.onAddProjectCallback,
    @required this.onTapProjectCallback,
  });

  final List<Project> projects;
  final OnAddProjectCallback onAddProjectCallback;
  final OnTapProjectCallback onTapProjectCallback;

  static _ViewModel from(BuildContext context, Store<AppState> store, Uuid uuid) => _ViewModel(
        projects: store.state.projects.values.toList(),
        onAddProjectCallback: (projectName) => store.dispatch(AddProjectAction(Project(id: uuid.v4(), name: projectName))),
        onTapProjectCallback: (project) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TasksPage(projectId: project.id),
          ),
        ),
      );
}
