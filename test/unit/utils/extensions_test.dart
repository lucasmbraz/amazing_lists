import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MapExtension', () {
    test(
        'GIVEN a map '
        'WHEN #insert is called '
        'THEN it returns a new map with the added item', () {
      final project = Project(id: '1', name: 'Groceries');
      final oldMap = {};
      final expectedMap = {'1': project};

      final actualMap = oldMap.insertOrUpdate('1', project);

      expect(actualMap, expectedMap);
      expect(actualMap, isNot(equals(oldMap)));
    });
  });
}
