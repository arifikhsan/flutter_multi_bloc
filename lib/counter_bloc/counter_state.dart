part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int number;

  CounterInitial({this.number});
}

class CounterLoaded extends CounterState {}
