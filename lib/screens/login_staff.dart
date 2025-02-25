import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mon_projet/screens/dashboard.dart';

class LoginStaffScreen extends StatefulWidget {
  const LoginStaffScreen({super.key});

  @override
  State<LoginStaffScreen> createState() => _LoginStaffScreenState();
}

class _LoginStaffScreenState extends State<LoginStaffScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  void _validateManualLogin() async {
    String email = _emailController.text.trim();
    String pin = _pinController.text.trim();

    if (email.isEmpty || pin.isEmpty) {
      _showErrorDialog("Veuillez remplir tous les champs.");
      return;
    }

    try {
      var userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: email)
              .where('pin', isEqualTo: pin)
              .get();

      if (userDoc.docs.isNotEmpty) {
        // 🔹 Redirige vers le Dashboard après connexion réussie
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        _showErrorDialog("Email ou PIN incorrect.");
      }
    } catch (e) {
      _showErrorDialog("Erreur de connexion: $e");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Erreur"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Staff")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _pinController,
              decoration: const InputDecoration(
                labelText: "Code PIN (6 chiffres)",
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateManualLogin,
              child: const Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
