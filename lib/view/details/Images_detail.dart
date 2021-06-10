import 'package:booking_homestay_airbnb/constants.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Type(
              image:'assets/images/monmon.jpg',
              press: (){}),
          SizedBox(width: 10),
          Type(
              image:'assets/images/phongkhach.jpg',
              press: (){}),
          SizedBox(width: 10),
          Type(
              image:'assets/images/phongan.jpg',
              press: (){}),
          SizedBox(width: 10),
          Type(
              image:'assets/images/phongngu.jpg',
              press: (){}),
          SizedBox(width: 10),
          Type(
              image:'assets/images/toilet.jpg',
              press: (){})
        ],
      ),
    );
  }
}

class Type extends StatelessWidget {
  const Type({
    Key key, this.image, this.press,

  }) : super(key: key);

  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          // left: kDefaultPadding,
          // right: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding /2,
        ),
        width: size.width ,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
              image:  AssetImage(image),
              fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}