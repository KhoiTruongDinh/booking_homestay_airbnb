import 'package:booking_homestay_airbnb/view/profile/Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoUser extends StatefulWidget {

  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hồ sơ', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Body(),
        )
    );
  }
}