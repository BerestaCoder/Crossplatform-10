import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>PizzaBloc(),
      child: const PizzaView(),
    );
  }
}
class PizzaView extends StatelessWidget {
  const PizzaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Пицца"),
       ),
       body: Center(
          child: SizedBox(
            width: 500,
            height: 500,
            child: Column(
              children: [
                BlocBuilder<PizzaBloc, int>(
                  builder: (context, count) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text( '$count', style: Theme.of(context).textTheme.displayLarge),
                        const Icon(Icons.local_pizza_outlined, size: 50,)
                      ],
                    );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: "Увеличить кол-во",
                        child: IconButton(
                          onPressed: () {context.read<PizzaBloc>().add(PizzaIncrementPressed());},
                          icon: const Icon(Icons.add, size: 50,),
                        ),
                      ),
                      Tooltip(
                        message: "Обнулить",
                        child: IconButton(
                          onPressed: () {context.read<PizzaBloc>().add(PizzaSetZeroPressed());},
                          icon: const Icon(Icons.delete_outline, size: 50,),
                        ),
                      )
                    ],
                  )
                ],
              ),
          ),
          )
      );
  }
}

abstract class PizzaEvent{}
class PizzaIncrementPressed extends PizzaEvent {}
class PizzaSetZeroPressed extends PizzaEvent {}

class PizzaBloc extends Bloc<PizzaEvent, int> {
  PizzaBloc() : super(0) {
    on<PizzaIncrementPressed>((event, emit) => emit(state + 1));
    on<PizzaSetZeroPressed>((event, emit) => emit(state - state));
  }
}