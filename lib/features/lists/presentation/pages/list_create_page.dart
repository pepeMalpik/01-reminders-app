import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class ListCreatePage extends ConsumerStatefulWidget {
  static ListCreatePage builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const ListCreatePage();

  const ListCreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateListPageState();
}

class _CreateListPageState extends ConsumerState<ListCreatePage> {
  Color currentColor = Color(0xff443a49);

  _pickColorDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: currentColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('seleccionar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  void initState() {
    super.initState();
    ref.read(listProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    List<AppList> lists = ref.watch(listProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva lista'),
        actions: [
          TextButton(
            onPressed: null,
            child: const Text('Agregar'),
          ),
        ],
      ),
      body: Column(
        children: [
          AppCardForm(
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el nombre de la lista',
                label: Text('Nombre'),
              ),
            ),
          ),
          AppCardForm(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Color: ${currentColor.hexCode}'),
                GestureDetector(
                  onTap: _pickColorDialog,
                  child: CircleAvatar(
                    backgroundColor: currentColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
