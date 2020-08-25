import 'package:flutter/material.dart';
import 'package:econsult_new_project/screens/HomePage.dart';
import 'package:econsult_new_project/screens/ProfilePage.dart';
import 'package:econsult_new_project/screens/ChatPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List _children = [
    HomePage(),
    ChatPage(),
    ProfilePage(),
  ];
  // final tabs place

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
            backgroundColor: Colors.teal[600],
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Chats'),
            backgroundColor: Colors.teal[600],
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
            backgroundColor: Colors.teal[600],
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
