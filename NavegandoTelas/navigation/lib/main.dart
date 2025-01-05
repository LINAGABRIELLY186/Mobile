import 'package:flutter/material.dart';
import 'package:navigation/pages/intro_page.dart';
import 'package:navigation/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      
      initialRoute: '/', // Define a rota inicial como a tela de introdução
      routes: {
        '/': (context) => const IntroPage(), // Rota para a tela IntroPage
        '/homepage': (context) => const HomePage(), // Rota para a tela HomePage
      },
    );
  
  }
}