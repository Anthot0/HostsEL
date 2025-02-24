import 'package:flutter/material.dart';
import 'login_staff.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestion Maison d’Hôtes")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue dans votre logiciel de gestion !",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginStaffScreen()),
                );
              },
              child: const Text("Accès Personnel"),
            ),
          ],
        ),
      ),
    );
  }
}
