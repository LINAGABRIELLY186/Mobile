import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Volta para a tela anterior (IntroPage) usando pop
            Navigator.pop(context); 
          },
          child: const Text('Voltar para a Tela de Introdução'),
        ),
      ),
    );
  }
}
