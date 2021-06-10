
import 'package:booking_homestay_airbnb/view/details/BottomNarBar.dart';
import 'package:flutter/material.dart';

import 'Body.dart';


class DetailsScreen extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNartiveBar(),
    );
  }
}