import 'package:booking_homestay_airbnb/details/Bot_Nar_Bar.dart';
import 'package:flutter/material.dart';

import 'Body_details.dart';


class DetailsScreen extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNarBar_Detail(),
    );
  }
}