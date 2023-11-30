import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Custom TabBar Example'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Tab 1',
                  icon: Icon(Icons.star),
                ),
                Tab(
                  text: 'Tab 2',
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  text: 'Tab 3',
                  icon: Icon(Icons.grade),
                ),
              ],
              labelColor: Colors.blueAccent, // text color of the selected tab
              unselectedLabelColor: Colors.black54, // text color of unselected tabs
              indicatorColor: Colors.redAccent, // color of the selected tab indicator
              indicatorSize: TabBarIndicatorSize.label, // size of the indicator
              indicatorWeight: 4.0, // thickness of the indicator
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Content for Tab 1')),
              Center(child: Text('Content for Tab 2')),
              Center(child: Text('Content for Tab 3')),
            ],
          ),
        ),
      ),
    );
  }
}
