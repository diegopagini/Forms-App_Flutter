import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReseted>(_onCounterReseted);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReseted(CounterReseted event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
