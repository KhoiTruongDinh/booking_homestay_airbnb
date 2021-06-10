import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';


class TitleDetail extends StatelessWidget {
  const TitleDetail({
    Key key, this.title, this.country,
  }) : super(key: key);

  final String title, country;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text:"$title\n",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 26
                    ),
                  ),
                  TextSpan(
                      text: country,
                      style: TextStyle(
                        fontSize: 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w300,
                      )
                  )
                ]
            ),
          ),

        ],
      ),
    );
  }
}