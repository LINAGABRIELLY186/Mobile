import 'package:flutter/material.dart';
import 'package:mvc1/models/itemModel.dart';

class HomePage extends StatefulWidget {
  final List<Item> items;

  // Construtor para inicializar os itens
  HomePage({Key? key})
      : items = [
          Item(nome: "Arroz", chek: true),
          Item(nome: "Feijão", chek: true),
          Item(nome: "Farinha", chek: true),
        ],
        super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
        actions: [
          Icon(Icons.local_grocery_store),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.nome),
            value: item.chek,
            onChanged: (bool? value) {
              setState(() {
                item.chek = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}
