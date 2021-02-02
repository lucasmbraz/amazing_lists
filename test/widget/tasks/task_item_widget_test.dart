import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';

main() {
  testWidgets(
      'WHEN TaskItemWidget is displayed '
      'THEN it shows the task title ', (WidgetTester tester) async {
    final task = Task(id: '1', name: 'Apples');
    final widget = TaskItemWidget(task: task);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.text('Apples'), findsOneWidget);
  });
}
