import 'package:flutter/material.dart';
import 'package:praktikum7/pages/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2031710159 Dikhi Achmad Dani',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}
//2031710159 Dikhi Achmad Dani

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MovieList();
  }
}
//2031710159 Dikhi Achmad Dani