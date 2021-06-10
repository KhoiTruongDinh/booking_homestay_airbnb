import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

import 'Address.dart';
import 'Description.dart';
import 'Images_details.dart';
import 'Review.dart';
import 'Tittle_details.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageList(),
          SizedBox(height: kDefaultPadding),
          TitleDetail(
            title: "MoMo House",
            country: "Vũng Tàu",
          ),
          Divider(),
          SizedBox(height: kDefaultPadding ),
          Content(description: "Một ngôi nhà rộng và đẹp"),
          Divider(),
          Address(address: '123 Quận 9',),
          Divider(),
          SizedBox(height: kDefaultPadding ),
          Review(),
        ],
      ),
    );
  }
}