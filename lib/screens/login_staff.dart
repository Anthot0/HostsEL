import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_auth/local_auth.dart';

class LoginStaffScreen extends StatefulWidget {
  @override
  _LoginStaffScreenState createState() => _LoginStaffScreenState();
}

class _LoginStaffScreenState extends State<LoginStaffScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LocalAuthentication _localAuth = LocalAuthentication();

  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  bool _canCheckBiometrics = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    _canCheckBiometrics = await _localAuth.canCheckBiometrics;
    setState(() {});
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = await _localAuth.authenticate(
      localizedReason: 'Authentifiez-vous avec votre empreinte',
      options: const AuthenticationOptions(biometricOnly: true),
    );

    if (authenticated) {
      _signInWithFingerprint();
    }
  }

  Future<void> _signInWithFingerprint() async {
    try {
      var snapshot =
          await _firestore
              .collection('staff')
              .where(
                'empreinte',
                isEqualTo: 'UID_empreinte_001',
              ) // Remplace par l'UID détecté
              .get();

      if (snapshot.docs.isNotEmpty) {
        var userData = snapshot.docs.first.data();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bienvenue ${userData['nom']} ${userData['prenom']}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Empreinte non reconnue')));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _signInWithCode() async {
    try {
      var snapshot =
          await _firestore
              .collection('staff')
              .where('nom', isEqualTo: _nomController.text)
              .where('prenom', isEqualTo: _prenomController.text)
              .where('code', isEqualTo: _codeController.text)
              .get();

      if (snapshot.docs.isNotEmpty) {
        var userData = snapshot.docs.first.data();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bienvenue ${userData['nom']} ${userData['prenom']}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Identifiants incorrects')));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connexion du personnel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_canCheckBiometrics)
              ElevatedButton(
                onPressed: _authenticateWithBiometrics,
                child: Text('Connexion par empreinte digitale'),
              ),
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _prenomController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Code (6 chiffres)'),
              obscureText: true,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signInWithCode,
              child: Text('Connexion avec Nom & Code'),
            ),
          ],
        ),
      ),
    );
  }
}
