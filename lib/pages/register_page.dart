import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BUILDDDDDDDDDDDDDDDDDDDDDDDDD!!!!!");

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
            ElevatedButton(
              onPressed: () {
                // exampleProvider.contador = 300;
                // exampleProvider.cambiarContador(6);

                // ExampleProvider exampleProvider =
                //     Provider.of<ExampleProvider>(context, listen: false);
                // exampleProvider.agregaContador();

                // Provider.of<ExampleProvider>(context, listen: false)
                //     .agregaContador();

                //context.read<ExampleProvider>().agregaContador();

                PersonProvider personProvider =
                    Provider.of<PersonProvider>(context, listen: false);
                personProvider.addPerson("Juan Montes Tapia");
              },
              child: const Text(
                "Registrar",
              ),
            ),
            // Text(
            //   context.watch<ExampleProvider>().contador.toString(),
            // ),

            Consumer<ExampleProvider>(
              builder: (context, provider, _) {
                return Text(
                  provider.contador.toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                );
              },
            ),
            Consumer<ExampleProvider>(
              builder: (context, provider, _) {
                return Text(
                  provider.contador.toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}