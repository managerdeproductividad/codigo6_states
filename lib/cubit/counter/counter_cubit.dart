import 'package:flutter_bloc/flutter_bloc.dart';

//Estados
abstract class CounterState {}

class CounterInitState extends CounterState {
  final int data = 0;
}

class IncrementState extends CounterState {
  final int data;
  IncrementState(this.data);
}

class DecrementState extends CounterState {
  final int data;
  DecrementState(this.data);
}

//Cubit

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitState());

  increment() {
    if (state is CounterInitState) {
      CounterInitState pepe = state as CounterInitState;
      emit(IncrementState(pepe.data + 1));
      } else if (state is DecrementState) {
      DecrementState manolo = state as DecrementState;
      emit(IncrementState(manolo.data + 1));
    }else if (state is IncrementState) {
      IncrementState manolo = state as IncrementState;
      emit(IncrementState(manolo.data + 1));
    }
  }

  decrement() {
    if (state is CounterInitState) {
      CounterInitState pepe = state as CounterInitState;
      emit(DecrementState(pepe.data - 1));
    } else if (state is IncrementState) {
      IncrementState manolo = state as IncrementState;
      emit(DecrementState(manolo.data - 1));
    } else if (state is DecrementState) {
      DecrementState manolo = state as DecrementState;
      emit(DecrementState(manolo.data - 1));
    }
  }

  restart() {
    emit(CounterInitState());
  }
}