import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/provider_controller.dart';
import 'views/item_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(), // Initialize your provider here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local storage with sharePreferences',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ItemListScreen(),
    );
  }
}
