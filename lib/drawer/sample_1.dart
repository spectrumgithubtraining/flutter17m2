import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'logi.dart';

main(){
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> carName = [
    'Jeep W186X LandSUV',
    'LAND ROVER X800',
    'Benz S Class 350CDI',
    'AUDI Q5 40 TDI'
  ];
  final List<String> carImages = [
    'assets/images/whitecar.jpg',
    'assets/images/rangerover.jpg',
    'assets/images/blackcar.jpg',
    'assets/images/cargr.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          preferredSize: const Size.fromHeight(70),
        ),
        body:  ListView.builder(
          itemCount: carName.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //     const Details(), // Details widget for car details
                //   ),
                // );
              },
              child: Card(
                color: Colors.white70,
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10)),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          carImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        carName[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today_rounded,
                                  color: Colors.white70),
                              Text(
                                '2014',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.speed_rounded,
                                  color: Color.fromARGB(1768, 255, 204, 0)),
                              Text(
                                '59000 KM',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.info_outline_rounded,
                                  color: Colors.teal),
                              Text(
                                'Diesel',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.currency_rupee),
                              Text(
                                '71,00,000',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Color.fromARGB(000066, 0, 0, 102),
                          )
                        ],
                      ),
                    )
                    // Other car details here
                  ],
                ),
              ),
            );
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Add functionality when Drawer item 1 is selected
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Add functionality when Drawer item 2 is selected
                },
              ),
              // Add more items as needed
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.grey,
          backgroundColor: Colors.black38,
          height: 55,
          items: const <Widget>[
            Icon(Icons.call),
            Icon(Icons.attach_money),
            Icon(Icons.person_outline),
            Icon(Icons.favorite_border),
          ],
          onTap: (index) {
            // Handle bottom navigation item tap
          },
        ),

      ),
    );
  }
}



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.preferredSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tell us your dream",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
