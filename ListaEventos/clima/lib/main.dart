import 'dart:convert'; // Para manipular o JSON.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App do Tempo',
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String city = ""; // Cidade digitada.
  String weather = ""; // Descrição do clima.
  String temperature = ""; // Temperatura.

  Future<void> fetchWeather() async {
    final apiKey = "10bee91c874d86a4c661d69721cda119"; // Substitua pela sua chave.
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          weather = data['weather'][0]['description'];
          temperature = data['main']['temp'].toString();
        });
      } else {
        setState(() {
          weather = "Cidade não encontrada!";
          temperature = "";
        });
      }
    } catch (e) {
      setState(() {
        weather = "Erro ao buscar dados!";
        temperature = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App do Tempo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                city = value;
              },
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Buscar Clima'),
            ),
            SizedBox(height: 20),
            if (weather.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Clima: $weather',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Temperatura: $temperature°C',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
