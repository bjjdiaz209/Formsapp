import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));

  void increaseBy(int value) {
    emit(state.copyWhith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1));
  }

  void reset() {
    emit(state.copyWhith(
      counter: 0,
    ));
  }
}
