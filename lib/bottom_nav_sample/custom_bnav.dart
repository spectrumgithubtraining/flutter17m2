import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Icons and Styling'),
        ),
        body: Center(
          child: Text('Content of the selected tab'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.green),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.orange),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          onTap: (int index) {
            print('Tab $index selected');
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
