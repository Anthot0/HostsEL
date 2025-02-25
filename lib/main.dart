import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hosts_el/screens/home_screen.dart';
import 'package:hosts_el/screens/login_staff.dart';
import 'package:hosts_el/screens/dashboard.dart';
import 'package:hosts_el/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Maison d\'Hôtes',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginStaffScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
