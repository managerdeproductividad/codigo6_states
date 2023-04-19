import 'package:codigo6_states/pages/home_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
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

      ],
    
      child: MaterialApp(
        title: "Provider App",
        home: HomePage(),
      ),
    );
  }
}