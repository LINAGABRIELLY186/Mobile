import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Navigation Basics',
//     home: FirstRoute(),
//   ));
// }

// class FirstRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Open route'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondRoute()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Outro tipo de rota',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegação usando MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(title: 'Via MaterialPageRoute'),
                  ),
                );
              },
              child: Text('Ir para a Segunda Tela (MaterialPageRoute)'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegação usando rotas nomeadas
                Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: {'title': 'Via Rotas Nomeadas'},
                );
              },
              child: Text('Ir para a Segunda Tela (Rotas Nomeadas)'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String? title;

  SecondScreen({this.title});

  @override
  Widget build(BuildContext context) {
    // Obtém os argumentos da navegação por rotas nomeadas
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(
        title: Text(args?['title'] ?? title ?? 'Segunda Tela'),
      ),
      body: Center(
        child: Text(
          args?['title'] ?? title ?? 'Nenhum título fornecido',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
