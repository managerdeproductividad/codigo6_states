import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/note_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PostProvider postProvider =
          Provider.of<PostProvider>(context, listen: false);
      postProvider.getPosts2();

      NoteProvider noteProvider =
          Provider.of<NoteProvider>(context, listen: false);
      noteProvider.getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    // PostProvider postProvider2 =
    //     Provider.of<PostProvider>(context, listen: true);
    // postProvider.getPosts2();

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
      // body: Consumer<PostProvider>(
      //   builder: (context, provider, _) {
      //     if (provider.isLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return ListView.builder(
      //       itemCount: provider.posts.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text(provider.posts[index]["title"]),
      //           subtitle: Text(provider.posts[index]["body"]),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: Consumer<NoteProvider>(
        builder: (context, provider, _) {
          // if (provider.isLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return ListView.builder(
            itemCount: provider.notes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.notes[index]["title"]),
                subtitle: Text(provider.notes[index]["description"]),
                trailing: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: provider.notes[index]["status"]
                          ? Colors.greenAccent
                          : Colors.black12,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        // String id = provider.notes[index]["id"];
                        provider.updateNote(provider.notes[index]["id"]);
                      },
                      child: Text(
                        "Completar",
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      // body: Text(postProvider2.posts.toString()),
    );
  }
}
