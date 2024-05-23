import 'dart:math';
import 'package:crossplatform10/tools/save.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  Save _save1 = GetIt.I<Save>(instanceName: 'save_1');
  Save _save2 = GetIt.I<Save>(instanceName: 'save_2');

  // Future API
  void _saveSlotOne() {
    setState(() {
      _save1.setState(SaveState.loading);
    });
    Future<bool> messageFuture = getRandomBool();
    messageFuture.then((result){
      setState(() {
        if (result) {
          _save1.setState(SaveState.saved);
        } else {
          _save1.setState(SaveState.corrupted);
        }
      });
    });
  }
  // await
  Future<void> _saveSlotTwo() async {
    setState(() {
      _save2.setState(SaveState.loading);
    });
    bool result = await getRandomBool();
    setState(() {
      if (result)
        _save2.setState(SaveState.saved);
      else
        _save2.setState(SaveState.corrupted);
    });
  }
  // Возвращает истину или ложь, иммитируя загрузку сохранения
  Future<bool> getRandomBool() {
    return Future.delayed(Duration(seconds: 3), () => Random().nextBool());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Сохранение"),
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  child: ListTile(
                    title: const Text("Сохранение 1"),
                    subtitle: Text(_save1.getStateinText()),
                    trailing: IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () => _saveSlotOne(),
                    ),
                  )
              ),
              Card(
                  child: ListTile(
                    title: const Text("Сохранение 2"),
                    subtitle: Text(_save2.getStateinText()),
                    trailing: IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () => _saveSlotTwo(),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}