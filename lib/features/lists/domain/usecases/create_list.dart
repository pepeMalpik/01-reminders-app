import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class CreateList extends UseCase<AppList?, CreateListParams> {
  final ListRepository _repository;

  CreateList({required ListRepository repository}) : _repository = repository;

  @override
  Future<Either<AppFailure, AppList?>> call(
    CreateListParams params,
  ) async {
    return await _repository.create(
      name: params.name,
      icon: params.icon,
      hexColor: params.hexColor,
    );
  }
}

class CreateListParams {
  final String name;
  final String icon;
  final String hexColor;

  CreateListParams({
    required this.name,
    required this.icon,
    required this.hexColor,
  });
}
