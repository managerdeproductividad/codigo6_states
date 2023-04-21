import 'dart:async';

// enum RegisterEvent {
//   increment,
//   decrement,
//   register,
//   delete,
// }

abstract class RegisterEvent{}
class IncrementEvent extends RegisterEvent{
  int data;
  IncrementEvent(this.data);
}
class DecrementEvent extends RegisterEvent{
  int data;
  DecrementEvent(this.data);
}
class UpdateEvent extends RegisterEvent{}
class DeleteEvent extends RegisterEvent{}


class RegisterBloc {
  int _myCounter = 0;

  int get myCounter => _myCounter;

  final StreamController<int> _controller = StreamController.broadcast();
  Stream<int> get stream => _controller.stream;

  void addCounter(RegisterEvent event) {
    if(event is IncrementEvent){
      emit(_myCounter + event.data);
    }else if (event is DecrementEvent){
      emit(_myCounter - event.data);
    }

    // switch (event) {
    //   case RegisterEvent.increment:
    //     emit(_myCounter + 1);
    //     break;
    //   case RegisterEvent.decrement:
    //     emit(_myCounter - 1);
    //     break;
    //   case RegisterEvent.register:
    //     break;
    //   case RegisterEvent.delete:
    //     break;
    // }
    // _controller.add(_myCounter);
  }

  emit(int value) {
    if(value != _myCounter){
      _myCounter = value;
      _controller.add(_myCounter);
    }
  }

  void dispose() {
    _controller.close();
  }
}