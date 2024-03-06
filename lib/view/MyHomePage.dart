import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'Favorite_screen.dart';
import 'cartpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List screens = [
    const Dashbord(),
     const FavoriteScreen(),
     const Cartpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E- Commerce Shop"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart))
        ],
      ),
      body:  screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: currentIndex,
        onTap: (value){
         setState(()  => currentIndex = value);
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "Profile"),

        ],
      ),
    );
  }
}
