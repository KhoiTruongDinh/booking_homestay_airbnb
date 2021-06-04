import 'package:flutter/material.dart';
import 'Body.dart';
import 'BottomNarBar.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomNarBar(),
    );
  }
  AppBar buildAppBar()
  {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu_rounded),
        onPressed: (){},
      ),
    );
  }


}

