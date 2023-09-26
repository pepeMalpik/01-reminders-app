import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class ListDatasourceImpl implements ListDatasource {
  final _db = DbHelper();

  @override
  Future<AppList> create({
    required String name,
    required String icon,
    required String hexColor,
  }) async {
    final listDb = AppListModel(
      name: name,
      icon: icon,
      hexColor: hexColor,
      createdAt: DateTime.now(),
    );
    await _db.insert(
      table: AppConstants.listTable,
      row: listDb.toJson(),
    );
    return listDb;
  }

  @override
  Future<List<AppList>> fetch() async {
    List<AppList> lists = [];
    List<Map<String, dynamic>> rows;
    rows = await _db.queryAllRows(table: AppConstants.listTable);
    lists = List<AppList>.from(
      rows.map((x) {
        return AppListModel.fromJson(x);
      }).toList(),
    );
    return lists;
  }

  @override
  Future<int> remove({required int id}) async {
    final affectedRows = await _db.delete(
      table: AppConstants.listTable,
      id: id,
    );
    return affectedRows;
  }

  @override
  Future<AppList> update({
    required int id,
    required String name,
    required String icon,
    required String hexColor,
  }) async {
    final list = AppListModel(
      id: id,
      name: name,
      icon: icon,
      hexColor: hexColor,
      updatedAt: DateTime.now(),
    );
    _db.update(
      table: AppConstants.listTable,
      row: list.toJson(),
    );
    return list;
  }
}
