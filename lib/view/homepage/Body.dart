import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'BusinessType.dart';
import 'Location.dart';
import 'Title_with_Morebtn.dart';
import 'package:provider/provider.dart';

import 'Header_With_Searchbox.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithButton(title: 'Địa điểm', press: (){}),
          SizedBox(height: kDefaultPadding),
          Location(),
          SizedBox(height: kDefaultPadding),
          TitleWithButton(title: 'Loại hình',press:(){},),
          SizedBox(height: kDefaultPadding),
          BusinessType(),
          SizedBox(height: kDefaultPadding),
          FlatButton(
                child: Text('LogIn'),
                color: Colors.pink,
                textColor: Colors.white,
                onPressed: (){
                  context.read<AuthService>().logout();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)
                ),
              ),
        ],
      ),
    );
  }
  
}






