import 'package:reminders_app/features/lists/lists.dart';

class AppListModel extends AppList {
  AppListModel({
    super.id,
    super.name,
    super.hexColor,
    super.icon,
    super.createdAt,
    super.updatedAt,
  });

  factory AppListModel.fromJson(Map<String, dynamic> data) {
    return AppListModel(
      id: data['id'],
      name: data['name'],
      hexColor: data['hex_color'],
      icon: data['icon'],
      createdAt: DateTime.tryParse(data['created_at']),
      updatedAt: DateTime.tryParse(data['updated_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hex_color': hexColor,
      'icon': icon,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
