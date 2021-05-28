import 'package:flutter/material.dart';

import '../../constants.dart';



class BottomNarBar extends StatelessWidget {
  const BottomNarBar({
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
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: (){},

          ),
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),

            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.question_answer_outlined),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}