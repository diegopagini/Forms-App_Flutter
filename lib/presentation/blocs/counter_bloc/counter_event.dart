part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased({required this.value});
}
