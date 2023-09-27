import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reminders_app/features/lists/lists.dart';

// datasource
final listDatasource = Provider((ref) => ListDatasourceImpl());
// repository
final listRepository = Provider(
  (ref) => ListRepositoryImpl(datasource: ref.watch(listDatasource)),
);
