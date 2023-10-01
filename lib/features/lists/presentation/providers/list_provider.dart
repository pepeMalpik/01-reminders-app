import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/core/providers/app_messages_provider.dart';
import 'package:reminders_app/features/lists/lists.dart';

class ListNotifier extends StateNotifier<List<AppList>> {
  final StateNotifierProviderRef ref;
  late ListRepository _repository;

  ListNotifier(this.ref) : super([]) {
    _repository = ref.watch(listRepository);
  }

  void create({
    required String name,
    required String icon,
    required String hexColor,
  }) async {
    final res = await _repository.create(
      name: name,
      icon: icon,
      hexColor: hexColor,
    );
    res.fold(
      (l) {
        ref.read(appMessagesProvider.notifier).state = AppMessage(
          type: MessageType.failure,
          msg: 'Error al crear la lista ${l.msg}',
        );
      },
      (r) {
        ref.read(appMessagesProvider.notifier).state = AppMessage(
          type: MessageType.success,
          msg: 'Lista creada con éxito',
        );
        fetch();
      },
    );
  }

  remove({required int listId}) async {
    final res = await _repository.remove(id: listId);
    res.fold(
      (l) {
        fetch();
      },
      (r) {
        ref.read(appMessagesProvider.notifier).state = AppMessage(
          type: MessageType.success,
          msg: 'Lista eliminada con éxito',
        );
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
}

final listProvider = StateNotifierProvider<ListNotifier, List<AppList>>(
  (ref) => ListNotifier(ref),
);
