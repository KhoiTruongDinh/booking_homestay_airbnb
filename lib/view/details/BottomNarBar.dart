import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

class BottomNartiveBar extends StatelessWidget {
  const BottomNartiveBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding ,
        right:  kDefaultPadding ,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 80),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: ("\$50/\n"),
                      style: Theme.of(context)
                          .textTheme.headline5
                          .copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    TextSpan(
                        text: ("đêm"),
                        style: Theme.of(context)
                            .textTheme.headline5.copyWith(color: kTextColor,fontSize: 16)
                    )
                  ]
              )
          ),
          Spacer(),
          SizedBox(
            height: 50,
            width: 300,
            child: FlatButton(
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              onPressed: (){},
              child: Text('Kiểm tra tình trạng đặt phòng',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}