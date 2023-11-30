import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 10, // number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Scrollable TabBar Example'),
            bottom: TabBar(
              isScrollable: true, // make the tabs scrollable
              tabs: List.generate(10, (index) => Tab(text: 'Tab $index')),
            ),
          ),
          body: TabBarView(
            children: List.generate(
              10,
                  (index) => Center(child: Text('Content for Tab $index')),
            ),
          ),
        ),
      ),
    );
  }
}