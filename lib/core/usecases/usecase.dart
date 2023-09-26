import 'package:dartz/dartz.dart';
import 'package:reminders_app/core/core.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppFailure, Type>> call(Params params);
}

class NoParams {}
