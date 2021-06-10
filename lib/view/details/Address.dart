import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({
    Key key, this.address,
  }) : super(key: key);

  final String address;

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
                      text:"Liên hệ\n",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: kTextColor, fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(

                        text: "     Địa chỉ: $address\n",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        )
                    ),

                  ]
              ),

            ),
          ]
      ),
    );
  }
}
