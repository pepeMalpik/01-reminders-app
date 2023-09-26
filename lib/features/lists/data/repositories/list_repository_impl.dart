import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/error/app_failures.dart';
import 'package:reminders_app/features/lists/lists.dart';

class ListRepositoryImpl implements ListRepository {
  final ListDatasource _datasource;

  ListRepositoryImpl({required ListDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<AppFailure, AppList>> create({
    required String name,
    required String icon,
    required String hexColor,
  }) async {
    try {
      final res = await _datasource.create(
        name: name,
        icon: icon,
        hexColor: hexColor,
      );
      return Right(res);
    } catch (e) {
      return Left(StoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<AppList>>> fetch() async {
    try {
      final res = await _datasource.fetch();
      return Right(res);
    } catch (e) {
      return Left(StoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, int>> remove({required int id}) async {
    try {
      final res = await _datasource.remove(
        id: id,
      );
      return Right(res);
    } catch (e) {
      return Left(StoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, AppList>> update({
    required int id,
    required String name,
    required String icon,
    required String hexColor,
  }) async {
    try {
      final res = await _datasource.update(
        id: id,
        name: name,
        icon: icon,
        hexColor: hexColor,
      );
      return Right(res);
    } catch (e) {
      return Left(StoreFailure(e.toString()));
    }
  }
}
