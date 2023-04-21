import 'package:codigo6_states/cubit/counter/counter_cubit.dart';
import 'package:codigo6_states/pages/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterBloc registerBloc = RegisterBloc();

  @override
  void dispose() {
    super.dispose();
    registerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(),
            const SizedBox(
              height: 12.0,
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (BuildContext context, CounterState state) {
                print(state.runtimeType);
                switch (state.runtimeType) {
                  case CounterInitState:
                    int value = (state as CounterInitState).data;
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    );
                  case IncrementState:
                    int value = (state as IncrementState).data;
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    );
                  case DecrementState:
                    int value = (state as DecrementState).data;
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    );
                  default:
                    return const Center();
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                // registerBloc.addCounter(IncrementEvent(10));
                context.read<CounterCubit>().increment();
              },
              child: const Text(
                "Registrar",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // registerBloc.addCounter(IncrementEvent(10));
                context.read<CounterCubit>().decrement();
              },
              child: const Text(
                "Registrar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}