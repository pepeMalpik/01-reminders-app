import 'package:reminders_app/features/lists/lists.dart';

abstract class ListDatasource {
  Future<AppList> create({
    required String name,
    required String icon,
    required String hexColor,
  });

  Future<AppList> update({
    required int id,
    required String name,
    required String icon,
    required String hexColor,
  });

  Future<int> remove({required int id});

  Future<List<AppList>> fetch();
}
