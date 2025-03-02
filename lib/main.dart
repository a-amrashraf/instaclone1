// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:instaclone1/Pages/LogIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Landing Page'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Builder(
          // This Builder provides a new context that is a descendant of MaterialApp
          builder: (BuildContext newContext) {
            return Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(newContext).push(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                icon: Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
