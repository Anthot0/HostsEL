import 'package:flutter/material.dart';

class LoginStaffScreen extends StatefulWidget {
  const LoginStaffScreen({super.key});

  @override
  State<LoginStaffScreen> createState() => _LoginStaffScreenState();
}

class _LoginStaffScreenState extends State<LoginStaffScreen> {
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  void _validateManualLogin() {
    // Implémentez la logique de validation ici
    print("Validation du login...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Staff')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _pinController,
              decoration: const InputDecoration(
                labelText: 'Code PIN (6 chiffres)',
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateManualLogin,
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
