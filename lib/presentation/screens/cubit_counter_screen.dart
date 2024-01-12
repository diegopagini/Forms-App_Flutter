import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CoubitCounterView(),
    );
  }
}

class _CoubitCounterView extends StatelessWidget {
  const _CoubitCounterView();
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state; // Like provider

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Cubit Counter: ${counterState.transactionCount} transactions.'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      // To let cubit render only this widget "BlocBuilder"
      body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
        buildWhen: (previous, current) =>
            current.counter !=
            previous
                .counter, // To render only when the new value is diferent than the previou
        builder: (context, state) {
          return Text('Counter value: ${state.counter}');
        },
      )),
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
            onPressed: () => increaseCounterBy(context, 1))
      ]),
    );
  }
}
