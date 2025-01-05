import 'package:flutter/material.dart';

//import 'package:navigation/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('I n t r o')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Home"),
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            const SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              child: const Text("Voltar para a Primeira Tela"),
              onPressed: () {
                Navigator.pop(context); // Retorna para a tela anterior
              },
            ),
          ],
        ),
      ),
    );
  }
}

