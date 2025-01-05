import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'CONTADOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text('Lina gabrielly'),
              accountEmail: Text('linagabrielly@gamil.com'),
              currentAccountPicture: CircleAvatar(
                  
                  //backgroundImage: NetworkImage('https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2023/12/13/istock-1331962950-1iemnjv7a6ng6.jpg'),
                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Flamengo-RJ_%28BRA%29.png/489px-Flamengo-RJ_%28BRA%29.png'),
              ),
            ),
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
                
      
              ),
              child: Text("MENU",
               style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,

              ),
              ),
              
            ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: const Text('Saldo'),
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
           
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: const Text('Extrato'),
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
           
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: const Text('Pagamento'),
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
           
          ),
          ],

        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sua pontuação:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home),
         label:'Home',
         ),
        BottomNavigationBarItem(icon: Icon(Icons.settings),
         label: 'Settings'),
],),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}