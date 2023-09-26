import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class FetchLists extends UseCase<List<AppList?>, NoParams> {
  final ListRepository _repository;

  FetchLists({required ListRepository repository}) : _repository = repository;

  @override
  Future<Either<AppFailure, List<AppList?>>> call(
    NoParams params,
  ) async {
    return await _repository.fetch();
  }
}
