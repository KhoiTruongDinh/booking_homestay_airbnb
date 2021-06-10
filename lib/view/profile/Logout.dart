import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';


class Logout extends StatelessWidget {
  const Logout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SizedBox(
        height: 30,
        width: 200,
        child: RaisedButton(
          onPressed: (){},
          color: Colors.white70,
          child: Text('Logout',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}