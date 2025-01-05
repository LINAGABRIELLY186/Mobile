import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        //colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 6, 0, 16)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gasolina x Alcool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _alcoolController = TextEditingController();
  String _resultado = "";
  void _calcular() {
    final double? gasolina = double.tryParse(_gasolinaController.text);
    final double? alcool = double.tryParse(_alcoolController.text);

    if (gasolina == null || alcool == null) {
      setState(() {
        _resultado = "Por favor, insira valores válidos.";
      });
      return;
    }
  final double proporcao = alcool / gasolina;
    setState(() {
      
      if (proporcao <= 0.7) {
        _resultado = "Valor:${proporcao.toStringAsFixed(2)}. Melhor abastecer com álcool. ";
      } else {
        _resultado = "Valor:${proporcao.toStringAsFixed(2)}. Melhor abastecer com gasolina.";
      }
    });
  }


 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.green, 
        title: Text(
          'Cálculo de Combustível'
          ),
        
          
      ),
      body: Center(
        
        child: Column(
          
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            new Container(
                 height: 300.0,
                 width: 300.0,
                 decoration:new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage('images/img2.jpg'),
                         fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
      ),
    ),
         SizedBox(height: 20.0),

         Container(
           padding: EdgeInsets.symmetric( horizontal: 16.0),
           width: 200,
           child: TextField(
            controller: _gasolinaController,
            keyboardType: TextInputType.number,
             obscureText: false,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Valor da gasolina',
               prefixIcon: Icon(Icons.local_gas_station, size: 30, color: Colors.blue)
               
             ),
            
           ),
         ),
          SizedBox(height: 20.0),
         
         Container(
           padding: EdgeInsets.symmetric( horizontal: 16.0),
           width: 200,
          
           child: TextField(
            controller: _alcoolController,
            keyboardType: TextInputType.number,
             obscureText: false,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Valor do alcool',
               prefixIcon: Icon(Icons.local_gas_station, size: 30, color: Colors.blue)

               
             ),
            
           ),
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
          style: ElevatedButton.styleFrom(
           backgroundColor: Colors.green[700],
            shadowColor: const Color.fromARGB(255, 224, 229, 224),
             elevation: 3,
            ),
          onPressed: _calcular, 
          child: Text(
            "CALCULAR",
           style: TextStyle(color: Colors.white),
          ),
         ),
          SizedBox(height: 16),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),

          ],
        ),
      ),
      

    );
  }
}