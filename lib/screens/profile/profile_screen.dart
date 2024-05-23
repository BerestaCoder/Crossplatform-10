import 'package:crossplatform10/screens/profile/profile_settings_screen.dart';
import 'package:crossplatform10/tools/save.dart';
import 'package:crossplatform10/tools/user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _openProfileSettingsScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettingsScreen())).then((_) => setState(() {}));
  }
  Save _save1 = GetIt.I<Save>(instanceName: 'save_1');
  Save _save2 = GetIt.I<Save>(instanceName: 'save_2');
  
  @override
  Widget build(BuildContext context) {
    String name = UserWidget.of(context).name;
    int age = UserWidget.of(context).age;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Профиль'),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              Card(
                 child: ListTile(
                   title: Text(name),
                   subtitle: Text("$age лет"),
                   trailing: IconButton(
                     icon: const Icon(Icons.draw),
                     onPressed: () => _openProfileSettingsScreen(),
                     tooltip: "Изменить информацию о пользователе",
                   ),
                 )
              ),
              const SizedBox(height: 10,),
              Text("Сохранение 1:${_save1.getStateinText()}"),
              const SizedBox(height: 10,),
              Text("Сохранение 2:${_save2.getStateinText()}")
            ],
          ),
        ),
      )
    );
  }
}