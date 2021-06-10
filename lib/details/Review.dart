import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

import 'Rating.dart';

class Review extends StatelessWidget {
  const Review({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          TextRv(),
          Comment(),
          SizedBox(height: kDefaultPadding * 2),
          RatingBox(),
          RaisedButton(
              child: Text('Gửi ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                side: BorderSide(color: Colors.white),
              ),
              hoverColor: Colors.indigo,
              onPressed: (){}
          ),
        ],
      ),
    );
  }
}



class TextRv extends StatelessWidget {
  const TextRv({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text:"Đánh giá\n",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: kTextColor, fontWeight: FontWeight.bold
                  ),
                ),
              ]
          ),

        ),
      ],
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: ('Bình luận'),
        ) ,
      ),
    );
  }
}

