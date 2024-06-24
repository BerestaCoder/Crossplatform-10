import 'package:crossplatform10/screens/list/listview_screen.dart';
import 'package:crossplatform10/screens/list/listview_separated_screen.dart';
import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});
  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {

  final columnItems = List.generate(10, (index) => 'Предмет ${index + 1}');

  void _addItem() {
    setState(() { columnItems.add('Добавленный предмет'); });
  }
  void _deleteItem(int index){
    setState(() {
      columnItems.removeAt(index);
    });
  }

  @override  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Column"),),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 72,
                  icon: const Icon(Icons.chevron_left),
                  tooltip: "ListView separated",
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListViewSeparatedScreen())),
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
                  tooltip: "ListView",
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListViewScreen())),
                ),
              ],
            ),
            Column(
                children: [
                  for (int i = 0; i < columnItems.length; i++)
                    Card(
                        child: ListTile(
                          title: Text(columnItems[i]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteItem(i),
                          ),
                        )
                    )
                ]
            ),
          ],
        )
    );
  }
}