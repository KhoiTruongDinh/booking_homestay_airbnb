import 'package:flutter/material.dart';

import '../../constants.dart';



class BusinessType extends StatelessWidget {
  const BusinessType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Type(
              image:'assets/images/hotel.jpg',
              press: (){}),
          SizedBox(width: 10),
          Type(
              image:'assets/images/homestay.jpg',
              press: (){}),
          SizedBox(width: 10),
          Type(
              image:'assets/images/full_house.jpg',
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
          left: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding /2,
        ),
        width: size.width*0.8,
        height: 200,
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