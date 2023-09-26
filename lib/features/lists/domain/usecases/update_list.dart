import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class UpdateList extends UseCase<AppList?, UpdateListParams> {
  final ListRepository _repository;

  UpdateList({required ListRepository repository}) : _repository = repository;

  @override
  Future<Either<AppFailure, AppList?>> call(
    UpdateListParams params,
  ) async {
    return await _repository.update(
      id: params.id,
      name: params.name,
      icon: params.icon,
      hexColor: params.hexColor,
    );
  }
}

class UpdateListParams {
  final int id;
  final String name;
  final String icon;
  final String hexColor;

  UpdateListParams({
    required this.id,
    required this.name,
    required this.icon,
    required this.hexColor,
  });
}
