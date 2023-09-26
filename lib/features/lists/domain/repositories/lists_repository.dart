import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

abstract class ListRepository {
  Future<Either<AppFailure, AppList>> create({
    required String name,
    required String icon,
    required String hexColor,
  });

  Future<Either<AppFailure, AppList>> update({
    required int id,
    required String name,
    required String icon,
    required String hexColor,
  });

  Future<Either<AppFailure, int>> remove({required int id});

  Future<Either<AppFailure, List<AppList>>> fetch();
}
