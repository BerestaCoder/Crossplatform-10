import 'package:crossplatform10/screens/list/column_screen.dart';
import 'package:crossplatform10/screens/list/listview_separated_screen.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {

  final listViewItems = List.generate(10, (index) => 'Предмет ${index + 1}');

  void _addItem() {
    setState(() { listViewItems.add('Добавленный предмет'); });
  }
  void _deleteItem(int index){
    setState(() { listViewItems.removeAt(index); });
  }

  @override  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("ListView"),),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 72,
                  icon: const Icon(Icons.chevron_left),
                  tooltip: "Column",
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ColumnScreen())),
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
                  tooltip: "ListView separated",
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListViewSeparatedScreen())),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                  children: [
                    for (int i = 0; i < listViewItems.length; i++)
                      Card(
                          child: ListTile(
                            title: Text(listViewItems[i]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _deleteItem(i),
                            ),
                          )
                      )
                  ]
              ),
            ),
          ],
        )
    );
  }
}