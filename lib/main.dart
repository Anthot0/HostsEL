import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mon_projet/screens/home_screen.dart';
import 'package:mon_projet/screens/login_staff.dart';
import 'package:mon_projet/screens/dashboard.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Maison d’Hôtes',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginStaffScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
