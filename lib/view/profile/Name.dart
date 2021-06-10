import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';


class Name_user extends StatelessWidget {
  const Name_user({
    Key key, this.name,
  }) : super(key: key);

  final String name;

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
                Icons.person_rounded,
              ),
              SizedBox(width: 20),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: name,
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