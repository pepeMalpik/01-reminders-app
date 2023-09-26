abstract class AppFailure {
  final String msg;

  AppFailure(this.msg);
}

class ServerFailure extends AppFailure {
  ServerFailure(super.msg);
}

class CacheFailure extends AppFailure {
  CacheFailure(super.msg);
}

class StoreFailure extends AppFailure {
  StoreFailure(super.msg);
}

class CatchFailure extends AppFailure {
  CatchFailure(super.msg);
}
