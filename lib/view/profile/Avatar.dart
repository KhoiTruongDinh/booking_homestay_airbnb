import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/logo.png"),
      ),
    );
  }
}
