import 'package:clothing_app/Views/Details/wishlist.dart';
import 'package:clothing_app/Views/Details/cart.dart';
import 'package:clothing_app/Views/Details/profile.dart';
import 'package:clothing_app/Views/Details/search.dart';
import 'package:clothing_app/Views/Home/homescreen.dart';
import 'package:clothing_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  final List<String> wishlist = [];

  late List<Widget> _pages; // Declare without initialization

  @override
  void initState() {
    super.initState();
    _pages = [
      Homescreen(),
      SearchPage(),
      CartPage(),
      WishList(),
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change active tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBG,
        leading: IconButton(
          icon: SvgPicture.asset("assets/Images/Icon.svg"),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(color: Colors.white, Icons.notifications),
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Show selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainBG,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle taps
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
