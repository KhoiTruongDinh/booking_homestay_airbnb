import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

import 'Avatar.dart';
import 'Logout.dart';
import 'Mail.dart';
import 'Name.dart';
import 'Phone.dart';



class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar(),
        SizedBox(height: kDefaultPadding * 3),
        Name_user(name: 'Nguyen Toan Khoa'),
        SizedBox(height: kDefaultPadding),
        Phone_user(phone: '0123456789',),
        SizedBox(height: kDefaultPadding),
        Mail_user(mail: 'ntkhoa@gmail.com',),
        SizedBox(height: kDefaultPadding * 3),
        Logout()

      ],
    );
  }
}
