import 'package:crossplatform10/screens/basket/basket_screen.dart';
import 'package:crossplatform10/screens/list/column_screen.dart';
import 'package:crossplatform10/screens/pizza/pizza_screen.dart';
import 'package:crossplatform10/tools/save.dart';
import 'package:crossplatform10/screens/profile/profile_screen.dart';
import 'package:crossplatform10/tools/platform_checker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    GetIt.I.registerSingleton<Save>(Save(SaveState.empty), instanceName: 'save_1');
    GetIt.I.registerSingleton<Save>(Save(SaveState.saved), instanceName: 'save_2');

    super.initState();
  }

  PlatformChecker pl = new PlatformChecker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Домащняя страница'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pl.isDesktopInterface() ? const Text("Приложение запущено на компьютере") : const Text("Приложение запущено на телефоне"),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // =========== Профиль
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text("Профиль"),
                          ],
                        )
                    ),
                    // =========== Корзина
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BasketScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.shopping_basket_outlined),
                            Text("Корзина"),
                          ],
                        )
                    ),
                    // =========== Списки
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ColumnScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.list),
                            Text("Разные списки"),
                          ],
                        )
                    ),
                    // =========== Пицца
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PizzaScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.local_pizza_outlined),
                            Text("Пицца"),
                          ],
                        )
                    ),
                    // =========== Сохранения
                    ElevatedButton(
                        onPressed: () => context.go('/save_screen'),
                        child: const Row(
                          children: [
                            Icon(Icons.save),
                            Text("Сохранение"),
                          ],
                        )
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}