import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});
  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

enum MyItem{
  pizza, cake, tea
}

class _BasketScreenState extends State<BasketScreen> {
  MyItem chosenItem = MyItem.pizza;
  int _pizzza_counter = 0;
  int _cake_counter = 0;
  int _tea_counter = 0;
  String _text = 'Пицца — традиционное итальянское блюдо, изначально в виде круглой дрожжевой лепёшки, выпекаемой с уложенной сверху начинкой из томатного соуса, сыра и зачастую других ингредиентов, таких как мясо, овощи, грибы и прочие продукты';
  String _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/pizza.png';

  void _incrementItem() {
    setState(() {
      switch (chosenItem){
        case MyItem.pizza:
          _pizzza_counter++;
          context.read<PizzaBloc>().add(PizzaIncrementPressed());
        case MyItem.cake:
          _cake_counter++;
        case MyItem.tea:
          _tea_counter++;
      }
    });
  }
  void _decrementItem() {
    setState(() {
      switch (chosenItem){
        case MyItem.pizza:
          if (_pizzza_counter>0) _pizzza_counter--;
          context.read<PizzaBloc>().add(PizzaDecrementPressed());
        case MyItem.cake:
          if (_cake_counter>0) _cake_counter--;
        case MyItem.tea:
          if (_tea_counter>0) _tea_counter--;
      }
    });
  }
  void _clickPizza() {
    setState(() {
      _text = 'Пицца — традиционное итальянское блюдо, изначально в виде круглой дрожжевой лепёшки, выпекаемой с уложенной сверху начинкой из томатного соуса, сыра и зачастую других ингредиентов, таких как мясо, овощи, грибы и прочие продукты';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/pizza.png';
      chosenItem = MyItem.pizza;
    });
  }
  void _clickCake() {
    setState(() {
      _text = 'Торт — кондитерское изделие, состоящее из нескольких коржей, пропитанных кремом или джемом. Сверху торт обычно украшают кремом, глазурью или фруктами.';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/cake.png';
      chosenItem = MyItem.cake;
    });
  }
  void _clickTea() {
    setState(() {
      _text = 'Чай — напиток, получаемый варкой, завариванием и/или настаиванием листа чайного куста, который предварительно подготавливается специальным образом.';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/coffe.png';
      chosenItem = MyItem.tea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Корзина"),
        ),
        body: Center(
            child :Container(
                width: 500,
                margin: const EdgeInsets.all(20),
                child: Center(
                    child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: _clickPizza,
                                    child: Row(children: [const Icon(Icons.local_pizza_outlined), Text("Пицца $_pizzza_counter")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickCake,
                                    child: Row(children: [const Icon(Icons.cake), Text("Торт $_cake_counter")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickTea,
                                    child: Row(children: [const Icon(Icons.coffee), Text("Чай $_tea_counter")])
                                )
                              ]
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: 500,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.secondaryContainer,
                              ),
                              child: Column(
                                children: [
                                  Text('$_text'),
                                  CachedNetworkImage(
                                    imageUrl: _url,
                                    progressIndicatorBuilder: (c, url, p) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: _incrementItem,
                                  child: Text('Добавить')
                              ),
                              ElevatedButton(
                                  onPressed: _decrementItem,
                                  child: Text('Убрать')
                              )
                            ],
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}
// Вместительность корзины
abstract class PizzaEvent{}
class PizzaIncrementPressed extends PizzaEvent {}
class PizzaDecrementPressed extends PizzaEvent {}

class PizzaBloc extends Bloc<PizzaEvent, int> {
  PizzaBloc() : super(0) {
    on<PizzaIncrementPressed>((event, emit) => emit(state + 1));
    on<PizzaDecrementPressed>((event, emit) => emit(state - 1));
  }
}