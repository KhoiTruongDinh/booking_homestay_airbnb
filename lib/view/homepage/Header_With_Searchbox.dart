import 'package:flutter/material.dart';

import '../../constants.dart';


class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding *2.5),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: kDefaultPadding,
                bottom: 35 + kDefaultPadding
            ),
            height: size.height * 0.2 - 30,
            decoration: BoxDecoration(color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)
                )
            ),
            child: Row(
              children: [
                Text('Welcome!', style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold
                ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow:[
                    BoxShadow(
                      offset: Offset(0,10),
                      blurRadius: 20,
                      color: kPrimaryColor.withOpacity(0.25),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value){},
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: kTextColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search)
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}