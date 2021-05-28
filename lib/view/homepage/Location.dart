import 'package:flutter/material.dart';

import '../../constants.dart';


class Location extends StatelessWidget {
  const Location({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          LocationCard(
            image: 'assets/images/saigon.jpg',
            title: 'Tp. Hồ Chí Minh',
            press: (){},
          ),
          SizedBox(width: 10),
          LocationCard(
            image: 'assets/images/nhatrang.jpg',
            title: 'Nha Trang',
            press: (){},
          ),
          SizedBox(width: 10),
          LocationCard(
            image: 'assets/images/vungtau.jpg',
            title: 'Vũng Tàu',
            press: (){},
          ),
          SizedBox(width: 10),
          LocationCard(
            image: 'assets/images/phuquoc.png',
            title: 'Phú Quốc',
            press: (){},
          ),

        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key key, this.image, this.title, this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,

      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image(image: AssetImage(image))
          ),

          GestureDetector(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(
                left: 0,
                top: 0,
                bottom: 0,
              ),
              padding: EdgeInsets.all(kDefaultPadding /2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,10),
                      blurRadius: 200,
                      color: kPrimaryColor.withOpacity(0.4),
                    )
                  ]
              ),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(
                        text: '$title',
                        style: Theme.of(context).textTheme.button,
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
