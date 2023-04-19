import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Listado de items"),
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
      body: ListView(
        children: [
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripcion del item"),
          ),
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripcion del item"),
          ),
        ],
      ),
    );
  }
}
