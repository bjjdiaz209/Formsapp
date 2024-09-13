part of 'counter_bloc_bloc.dart';

abstract class CounterBlocEvent {
  const CounterBlocEvent();
}

class IncrementCounter extends CounterBlocEvent {
  final int value;
  IncrementCounter(this.value);
}

class CounterReset extends CounterBlocEvent {}
