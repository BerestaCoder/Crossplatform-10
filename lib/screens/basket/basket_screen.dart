import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});
  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  int _itemIndex = 0; // Пицца, Торт, Суп, Чай, Печенье
  int _pizza = 0;
  int _cake = 0;
  int _soup = 0;
  int _tea = 0;
  int _cookie = 0;

  String _text = 'Пицца — традиционное итальянское блюдо, изначально в виде круглой дрожжевой лепёшки, выпекаемой с уложенной сверху начинкой из томатного соуса, сыра и зачастую других ингредиентов, таких как мясо, овощи, грибы и прочие продукты';
  String _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/pizza.png';

  void _incrementItem() {
    setState(() {
      switch(_itemIndex){
        case 0:
          _pizza++;
        case 1:
          _cake++;
        case 2:
          _soup++;
        case 3:
          _tea++;
        default:
          _cookie++;
      }
    });
  }
  void _decrementItem() {
    setState(() {
      switch(_itemIndex){
        case 0:
          if(_pizza>0) _pizza--;
        case 1:
          if(_cake>0) _cake--;
        case 2:
          if(_soup>0) _soup--;
        case 3:
          if(_tea>0) _tea--;
        default:
          if(_cookie>0) _cookie--;
      }
    });
  }
  void _clickPizza() {
    setState(() {
      _text = 'Пицца — традиционное итальянское блюдо, изначально в виде круглой дрожжевой лепёшки, выпекаемой с уложенной сверху начинкой из томатного соуса, сыра и зачастую других ингредиентов, таких как мясо, овощи, грибы и прочие продукты';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/pizza.png';
      _itemIndex = 0;
    });
  }
  void _clickCake() {
    setState(() {
      _text = 'Торт — кондитерское изделие, состоящее из нескольких коржей, пропитанных кремом или джемом. Сверху торт обычно украшают кремом, глазурью или фруктами.';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/cake.png';
      _itemIndex = 1;
    });
  }
  void _clickSoup() {
    setState(() {
      _text = 'Суп — жидкое блюдо, в составе которого содержится не менее 50 % жидкости. Жидкую часть супа называют основой, плотную — гарниром.';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/soup.png';
      _itemIndex = 2;
    });
  }
  void _clickTea() {
    setState(() {
      _text = 'Чай — напиток, получаемый варкой, завариванием и/или настаиванием листа чайного куста, который предварительно подготавливается специальным образом.';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/tea.png';
      _itemIndex = 3;
    });
  }
  void _clickCookie() {
    setState(() {
      _text = 'Печенье — сухое, запеченное кондитерское изделие. Это лакомство включает в себя несчетное количество видов, вариантов основы и начинки.';
      _url = 'https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/cookie.png';
      _itemIndex = 4;
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
                width: 700,
                margin: const EdgeInsets.all(20),
                child: Center(
                    child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: _clickPizza,
                                    child: Row(children: [const Icon(Icons.local_pizza_outlined), Text("Пицца $_pizza")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickCake,
                                    child: Row(children: [const Icon(Icons.cake), Text("Торт $_cake")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickSoup,
                                    child: Row(children: [const Icon(Icons.soup_kitchen), Text("Суп $_soup")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickTea,
                                    child: Row(children: [const Icon(Icons.coffee), Text("Чай $_tea")])
                                ),
                                ElevatedButton(
                                    onPressed: _clickCookie,
                                    child: Row(children: [const Icon(Icons.cookie), Text("Печенье $_cookie")])
                                ),
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