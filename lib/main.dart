import 'package:flutter/material.dart';

void main() {
  runApp(const MonProjetApp());
}

class MonProjetApp extends StatelessWidget {
  const MonProjetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Maison d’Hôtes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Maison d’Hôtes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenue dans votre logiciel de gestion !',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajouter l’action pour voir les chambres
              },
              child: const Text('Voir les chambres'),
            ),
          ],
        ),
      ),
    );
  }
}
