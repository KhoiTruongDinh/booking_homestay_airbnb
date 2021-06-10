import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';


class Phone_user extends StatelessWidget {
  const Phone_user({
    Key key, this.phone,
  }) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding ),
      child: SizedBox(
          height: 50,
          width: 350,
          child: Row(
            children: [
              Icon(
                Icons.phone_android_outlined,
              ),
              SizedBox(width: 20),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Phone: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,

                          )
                      ),
                      TextSpan(
                          text: phone,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,

                          )
                      )
                    ]
                ),
              ),
            ],
          )

      ),
    );
  }
}