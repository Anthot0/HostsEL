import 'package:flutter/material.dart';
import 'package:hosts_el/screens/dashboard.dart';

class LoginStaffScreen extends StatelessWidget {
  const LoginStaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion Staff')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
          child: const Text('Se connecter'),
        ),
      ),
    );
  }
}
