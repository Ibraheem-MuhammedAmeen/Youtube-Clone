import 'package:flutter/material.dart';

import 'home.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              focusColor: Colors.white,
              backgroundColor: Colors.white24,
              shape: CircleBorder(),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            label: "Subs",
            icon: Icon(Icons.subscriptions_outlined),
          ),
          BottomNavigationBarItem(
            label: "You",
            icon: FloatingActionButton.small(
              onPressed: () {},
              child: Text('M'),
              focusColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Screens

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('🔍 Search Screen', style: TextStyle(fontSize: 24)));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('👤 Profile Screen', style: TextStyle(fontSize: 24)));
  }
}
