import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListBookings extends StatefulWidget {

  @override
  _ListBookingsState createState() => _ListBookingsState();
}

class _ListBookingsState extends State<ListBookings> {
  String host;
  @override
  Widget build(BuildContext context) {
    host= context.read<AuthService>().user;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}