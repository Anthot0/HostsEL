import 'package:flutter/material.dart';
import 'package:mon_projet/screens/login_staff.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4E5C2), // Fond inspiré du logo
      appBar: AppBar(
        title: const Text(
          'Gestion Maison d’Hôtes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0197F6), // Bleu océan du logo
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg', height: 150), // Ajout du logo
            const SizedBox(height: 20),
            const Text(
              'Bienvenue dans votre logiciel de gestion !',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0197F6), // Bleu océan
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Accès Personnel',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
