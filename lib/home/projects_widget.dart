import 'package:amazing_lists/home/project_item_widget.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:flutter/material.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({
    Key key,
    @required this.projects,
    @required this.onTapCallback,
  }) : super(key: key);

  final List<Project> projects;
  final OnTapProjectCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: projects.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => ProjectItemWidget(
        project: projects[index],
        onTapCallback: onTapCallback,
      ),
    );
  }
}
