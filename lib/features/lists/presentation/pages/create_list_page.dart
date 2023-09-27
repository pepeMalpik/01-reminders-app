import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminders_app/features/lists/lists.dart';

class CreateListPage extends ConsumerStatefulWidget {
  const CreateListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateListPageState();
}

class _CreateListPageState extends ConsumerState<CreateListPage> {
  @override
  void initState() {
    super.initState();
    ref.read(listProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    List<AppList> lists = ref.watch(listProvider);
    return Scaffold(
      appBar: AppBar(title: Text('${lists.length}')),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(lists[index].name ?? ''),
          subtitle: Text('${lists[index].id}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              ref.read(listProvider.notifier).remove(
                    listId: lists[index].id ?? 0,
                  );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(listProvider.notifier).create();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
