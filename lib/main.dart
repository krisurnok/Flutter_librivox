import 'package:flutter/material.dart';
import 'package:librivox_app/Model/AudioBookRes.dart';
import 'package:librivox_app/ui/home.dart';
// import 'ui/home.dart';
import 'Services/audioBookService.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => AudioBooksRes(),
    child:  MyApp()),
  );
 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ("Librivox"),
      home: new LibrivoxApp(),
    );
  }
}
