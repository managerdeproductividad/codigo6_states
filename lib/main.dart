import 'package:codigo6_states/pages/home_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/note_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //registrar a los providers usados en el app
        ChangeNotifierProvider(create: (context)=> PersonProvider()),
        ChangeNotifierProvider(create: (context)=> ExampleProvider()),
        ChangeNotifierProvider(create: (context)=> PostProvider()),
        ChangeNotifierProvider(create: (context)=> NoteProvider()),

      ],
    
      child: MaterialApp(
        title: "Provider App",
        home: HomePage(),
      ),
    );
  }
}