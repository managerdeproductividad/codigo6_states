import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExampleProvider exampleProvider =
        Provider.of<ExampleProvider>(context, listen: false);

    PersonProvider personProvider =
        Provider.of<PersonProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      // body: ListView.builder(
      //   itemCount: personProvider.people.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(personProvider.people[index]),
      //       subtitle: Text("Descripción del item"),
      //     );
      //   },
      // ),
      body: Consumer<PersonProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.people.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.people[index]),
                subtitle: Text("Descripción del item"),
              );
            },
          );
        },
      ),
    );
  }
}