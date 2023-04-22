
import 'package:codigo6_states/cubit/posts/posts_cubit.dart';
import 'package:codigo6_states/cubit/posts/posts_state.dart';
import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PostCubit>().getPostData();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<PostCubit, PostState>(
        builder: (BuildContext context, PostState state) {
          if(state is PostInitState || state is PostLoadingState){
            return const Center(child: CircularProgressIndicator());
          }else if (state is PostSuccedState){
            List data = state.posts;
            return Text(data.toString());
          }else {
            return SizedBox();
          }
        },
      ),
    );
  }
}