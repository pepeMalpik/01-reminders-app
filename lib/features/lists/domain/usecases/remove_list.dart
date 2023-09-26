import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class RemoveList extends UseCase<int?, RemoveListParams> {
  final ListRepository _repository;

  RemoveList({required ListRepository repository}) : _repository = repository;

  @override
  Future<Either<AppFailure, int?>> call(
    RemoveListParams params,
  ) async {
    return await _repository.remove(
      id: params.id,
    );
  }
}

class RemoveListParams {
  final int id;

  RemoveListParams({
    required this.id,
  });
}
