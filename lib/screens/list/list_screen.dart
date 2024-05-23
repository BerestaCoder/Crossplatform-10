import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  int currentPageIndex = 0;

  final columnItems = List.generate(10, (index) => 'Предмет ${index + 1}');
  final listViewItems = List.generate(10, (index) => 'Предмет ${index + 1}');
  final listViewSeparatedItems = List.generate(10, (index) => 'Предмет ${index + 1}');

  void _addItem() {
    setState(() {
      switch (currentPageIndex) {
        case 0:
          columnItems.add('Добавленный предмет');
        case 1:
          listViewItems.add('Добавленный предмет');
        case 2:
          listViewSeparatedItems.add('Добавленный предмет');
      }
    });
  }
  void _deleteColumnItem(int index){
    setState(() {
      columnItems.removeAt(index);
    });
  }
  void _deleteListViewItem(int index){
    setState(() {
      listViewItems.removeAt(index);
    });
  }
  void _deleteListViewSeperatedItem(int index){
    setState(() {
      listViewSeparatedItems.removeAt(index);
    });
  }

  @override  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Списки"),),
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            selectedIndex: currentPageIndex,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.looks_one),
                icon: Icon(Icons.looks_one_outlined),
                label: 'Column',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.looks_two),
                icon: Icon(Icons.looks_two_outlined),
                label: 'ListView',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.looks_3),
                icon: Icon(Icons.looks_3_outlined),
                label: 'ListView.separated',
              ),
            ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addItem,
          tooltip: 'Добавить предмет',
          child: const Icon(Icons.add),
        ),
        body: [

          // ================ Column
          Column(
              children: [
                for (int i = 0; i < columnItems.length; i++)
                  Card(
                      child: ListTile(
                        title: Text(columnItems[i]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteColumnItem(i),
                        ),
                      )
                  )
              ]
          ),

          // ================ ListView
          ListView(
              children: [
                for (int i = 0; i < listViewItems.length; i++)
                  Card(
                      child: ListTile(
                        title: Text(listViewItems[i]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteListViewItem(i),
                        ),
                      )
                  )
              ]
          ),

          // ================ ListView.separated
          ListView.separated(
            itemBuilder: (_, index) {
              return Card(
                  child: ListTile(
                    title: Text(listViewSeparatedItems[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteListViewSeperatedItem(index),
                    ),
                  )
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: listViewSeparatedItems.length,
          ),
        ][currentPageIndex]
    );
  }
}