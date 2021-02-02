import 'package:amazing_lists/model/project.dart';
import 'package:flutter/material.dart';

class ProjectItemWidget extends StatelessWidget {
  final Project project;
  final OnTapProjectCallback onTapCallback;

  const ProjectItemWidget({
    Key key,
    @required this.project,
    @required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.list,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(project.name),
      onTap: () => onTapCallback(project),
    );
  }
}

typedef OnTapProjectCallback = Function(Project project);
