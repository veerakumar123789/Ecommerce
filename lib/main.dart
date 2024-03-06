import 'package:ecommerce/view/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/cardProvider.dart';
import 'Provider/favoriteProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Wrap your root widget with MultiProvider
      providers: [
        // Define your providers here
        // Example:
         ChangeNotifierProvider(create: (_) => FavoriteProvider()),
         ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
