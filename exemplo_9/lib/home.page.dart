import 'package:exemplo_9/camera.page.dart';
import 'package:exemplo_9/contacts.page.dart';
import 'package:exemplo_9/gps.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   @override
  _HomePageState createState() => _HomePageState();
}

Widget _tabContent() {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(icon: Icon(Icons.gps_fixed)),
            Tab(icon: Icon(Icons.contact_phone))
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.yellow)
        ],
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> _children = [
    CameraPage(),
    GpsPage(),
    ContactsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outros'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text('Câmera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            title: Text('GPS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            title: Text('Contatos'),
          )
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
