import 'package:chatx/Main_Screen.dart';
import 'package:chatx/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue,
            ),
            elevation: 0,
            color: Colors.blue,
            titleTextStyle: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )
          )
        ),
      ),
  );
}