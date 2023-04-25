import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final responsePost = FutureProvider((ref) async {
  ApiService apiService = ref.watch(apiServiceProvider);
  return apiService.getPosts();
});

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsePostProvider = ref.watch(responsePost);

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
      body: responsePostProvider.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Text(data[index]["title"]);
            },
          );
        },
        error: (error, stackTrace) {
          return Text("ERROR");
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}