import 'package:codigo6_states/pages/register_bloc.dart';
import 'package:flutter/material.dart';

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
            StreamBuilder(
              stream: registerBloc.stream,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  return Text(
                    snap.data.toString(),
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  );
                }
                return Text(
                  "0",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                registerBloc.addCounter(IncrementEvent(1));
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