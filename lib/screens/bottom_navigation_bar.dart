import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 2;
  static const TextStyle _selectedLabelStyle = TextStyle(color: Colors.blue);
  static const TextStyle _unselectedLabelStyle = TextStyle(color: Colors.black);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items:<BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets_outlined,),
          label: 'Prolet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handshake,),
          label: 'Meetup',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy_rounded),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.cyanAccent,
      unselectedItemColor:Colors.black,
      selectedLabelStyle: _selectedLabelStyle,
      unselectedLabelStyle: _unselectedLabelStyle,
      onTap: _onItemTapped,
    );
  }
}
