import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:journal_app/database/notedao.dart';
import 'package:journal_app/pages/add_newitem.dart';

import 'home_widget.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteDao noteDao = Get.find();

  int _currentIndex = 0;

  final tabs = [
    HomeWidget(),
    AddNewItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2b7279),
        // body: noteList(),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFdff0f1),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color(0xFFdff0f1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              title: Text(
                'New',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color(0xFFdff0f1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Calendar',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color(0xFFdff0f1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color(0xFFdff0f1),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
