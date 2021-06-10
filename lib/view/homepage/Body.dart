import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:booking_homestay_airbnb/view/homepage/search/home_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'BusinessType.dart';
import 'Location.dart';
import 'Title_with_Morebtn.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            forceElevated: true,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  child: FlexibleSpaceBar(
                    background: Image(image: AssetImage('assets/images/house-in-the-woods.jpg'), fit: BoxFit.cover,),
                )),
                Positioned(
                  top: 5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: TextButton.icon(
                      label: const Text('Bạn sắp đi đâu?'),
                      icon: Icon(Icons.search_outlined),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute( builder: (context) => Search(),
                        ),
                  );
                      },
                      style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                              backgroundColor: MaterialStateProperty.all<Color>(kBackgroundColor),
                              minimumSize: MaterialStateProperty.all<Size>(Size(350, 20)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 25)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0)
                                  )
                              )
                          )
                      ),
                  ),
                ),
              ],
              ),
          ),
          ];
        },
        body:  Container(
          child: Builder(builder: (context){
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
            children: [
              //HeaderWithSearchBox(size: size),
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
          }),
        ),
      ),
    );
  }
  
}






