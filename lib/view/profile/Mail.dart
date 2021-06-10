import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';


class Mail_user extends StatelessWidget {
  const Mail_user({
    Key key, this.mail,
  }) : super(key: key);

  final String mail;

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
                Icons.mail_outline_outlined,
              ),
              SizedBox(width: 20),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Email: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,

                          )
                      ),
                      TextSpan(
                          text: mail,
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