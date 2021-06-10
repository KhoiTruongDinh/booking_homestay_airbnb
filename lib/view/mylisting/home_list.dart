import 'package:booking_homestay_airbnb/view/mylisting/places.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'bookings.dart';

class HomeList extends StatefulWidget {

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, value){
                return [
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: Colors.white10,
                    toolbarHeight: 150, //56
                    bottom: PreferredSize(
                    preferredSize: Size.fromHeight(40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: kPrimaryColor,
                        indicatorWeight: 1,
                        indicatorPadding: EdgeInsets.only(left: 20, right: 10),
                    tabs: [
                      Padding(padding:EdgeInsets.fromLTRB(5, 0, 0, 5),child: Text('Đặt chỗ',style: TextStyle(color: kPrimaryColor,fontSize: 20),)),
                      Padding(padding:EdgeInsets.fromLTRB(5, 0, 0, 5),child: Text('Nhà',style: TextStyle(color: kPrimaryColor,fontSize: 20),)),
                      ],
                    ))),
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Nhà của bạn',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 30),
                      ),
                    )
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  ListBookings(),
                  ListPlace()
                ],
              ),
            ),
          )
        ),
    );
  }
}