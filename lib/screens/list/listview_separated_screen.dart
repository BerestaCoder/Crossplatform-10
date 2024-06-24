import 'package:crossplatform10/screens/list/column_screen.dart';
import 'package:crossplatform10/screens/list/listview_screen.dart';
import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({super.key});
  @override
  State<ListViewSeparatedScreen> createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {

  final listViewSeparatedItems = List.generate(10, (index) => 'Предмет ${index + 1}');

  void _addItem() {
    setState(() { listViewSeparatedItems.add('Добавленный предмет'); });
  }
  void _deleteItem(int index){
    setState(() {
      listViewSeparatedItems.removeAt(index);
    });
  }

  @override  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("ListView separated"),),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 72,
                  icon: const Icon(Icons.chevron_left),
                  tooltip: "ListView",
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListViewScreen())),
                ),
                IconButton(
                  iconSize: 72,
                  icon: const Icon(Icons.add),
                  tooltip: "Добавить предмет",
                  onPressed: () => _addItem(),
                ),
                IconButton(
                  iconSize: 72,
                  icon: const Icon(Icons.chevron_right),
                  tooltip: "Column",
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ColumnScreen())),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return Card(
                      child: ListTile(
                        title: Text(listViewSeparatedItems[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteItem(index),
                        ),
                      )
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: listViewSeparatedItems.length,
              ),
            ),
          ],
        )
    );
  }
}