import 'package:flutter/material.dart';
import 'package:project_one/screens/cart_screen.dart';
import 'package:project_one/screens/more_screen.dart';

import '../models/bn_screen.dart';
import '../screens/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const   BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: HomeScreen()),
    const BnScreen(title: 'Cart', widget: CartScreen()),
    const BnScreen(title: 'More', widget: MoreScreen()),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body: _screens[_selectedPageIndex].widget,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        onTap: (int selectedPageIndex) {
          setState(() => _selectedPageIndex = selectedPageIndex);
        },
        showSelectedLabels: true,

        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(

              // security_outlined

              backgroundColor: Colors.grey,
              activeIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'),
          BottomNavigationBarItem(

              backgroundColor: Colors.grey,
              activeIcon: Icon(Icons.more_vert),
              icon: Icon(Icons.more_vert),
              label: 'More'),

        ],
      ),

    );
  }
}
