import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project_1/firebase_options.dart';
import 'package:firebase_project_1/pages/home_page.dart';
import 'package:firebase_project_1/pages/login_page.dart';
import 'package:firebase_project_1/pages/register_page.dart';
import 'package:firebase_project_1/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LogInPage(),
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        LogInPage.id: (context) => const LogInPage(),
        HomePage.id: (context) => const HomePage()
      },
    );
  }
}
