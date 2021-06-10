import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    Key key, this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding ),
      child: Row(
          children: [
            RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                      text:"Mô tả\n",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: kTextColor, fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(

                        text: "     $description\n",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        )
                    )
                  ]
              ),

            ),
          ]
      ),
    );
  }
}