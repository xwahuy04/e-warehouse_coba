import 'package:flutter/material.dart';
import 'awal/welcome_screen.dart';
import 'awal/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/kategori/kategori_screen.dart';
import 'screens/satuan/satuan_screen.dart';
import 'screens/lapor_masalah_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Warehouse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
     routes: {
  '/': (context) => WelcomeWidget(),
  '/login': (context) => LoginScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/kategori': (context) => KategoriWidget(),
  '/satuan': (context) => SatuanWidget(),
  '/lapor': (context) => LaporMasalahWidget(),
},

    );
  }
}
