import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const BlocCounterView(),
      create: (_) => CounterBloc(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context
        .read<CounterBloc>()
        .add(CounterIncreased(value: value)); // Add to dispatch events
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBlock) =>
            Text('Bloc transactions: ${counterBlock.state.transactionCount}')),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterReseted()),
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
          child: context.select((CounterBloc counterBlock) =>
              Text('Counter value: ${counterBlock.state.counter}'))),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3)),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2)),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context))
      ]),
    );
  }
}
