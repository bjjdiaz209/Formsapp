import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/counter_bloc/counter_bloc_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBlocBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBlocBloc>().add(IncrementCounter(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBlocBloc bloc) =>
              Text('bloc Counter ${bloc.state.transactionCount}'),
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<CounterBlocBloc>().add(CounterReset()),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
          child: context.select(
        (CounterBlocBloc counterBloc) =>
            Text('Conter vale: ${counterBloc.state.counter}'),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text('+3'),
              onPressed: () => increaseCounterBy(context, 3)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              child: const Text('+2'),
              onPressed: () => increaseCounterBy(context, 2)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              child: const Text('+1'),
              onPressed: () => increaseCounterBy(context, 1)),
        ],
      ),
    );
  }
}
