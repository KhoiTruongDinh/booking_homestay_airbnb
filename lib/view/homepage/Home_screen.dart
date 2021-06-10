import 'package:booking_homestay_airbnb/view/booking/home_booking.dart';
import 'package:booking_homestay_airbnb/view/like/home_like.dart';
import 'package:booking_homestay_airbnb/view/mylisting/home_list.dart';
import 'package:booking_homestay_airbnb/view/profile/info_user.dart';
import 'package:flutter/material.dart';
import 'Body.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _showScreen(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Yêu Thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.luggage_outlined),
            label: 'Chuyến Đi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bed_outlined),
            label: 'Nhà',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Bạn',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        ),
      ),
    );
  }
}

Widget _showScreen (int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return Body();
    case 1:
      return HomeLike();
    case 2:
      return HomeBooking();
    case 3:
      return HomeList();
    case 4:
      return InfoUser();
  }
  return Container();
}
