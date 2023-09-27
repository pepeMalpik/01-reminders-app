import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminders_app/features/lists/lists.dart';

class ListNotifier extends StateNotifier<List<AppList>> {
  final ref;
  late ListRepository _repository;

  ListNotifier(this.ref) : super([]) {
    _repository = ref.watch(listRepository);
  }

  remove({required int listId}) async {
    final res = await _repository.remove(id: listId);
    res.fold(
      (l) {
        fetch();
      },
      (r) {
        fetch();
      },
    );
  }

  fetch() async {
    final res = await _repository.fetch();
    res.fold(
      (l) {
        state = [];
      },
      (r) {
        state = r;
      },
    );
  }

  create() async {
    final res = await _repository.create(
      name: 'name',
      icon: 'icon',
      hexColor: 'hexColor',
    );
    return res.fold(
      (l) {
        // show error msg
      },
      (r) {
        fetch();
      },
    );
  }
}

final listProvider = StateNotifierProvider<ListNotifier, List<AppList>>(
  (ref) => ListNotifier(ref),
);
