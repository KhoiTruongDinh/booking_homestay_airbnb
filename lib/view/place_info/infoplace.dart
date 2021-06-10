import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../../constants.dart';

class PlaceDetails extends StatefulWidget {
  final String id;
  final int price;
  const PlaceDetails({ Key key, @required this.id,@required this.price}) : super(key: key);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('place').doc(widget.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Center(
              child: Text('Có lỗi!'),);
          }
          else{
            var doc = snapshot.data;
            return NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    floating: true,
                    backgroundColor: Colors.white,
                    expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(doc['pic'], fit: BoxFit.cover,),
                      ),
                  )
                ];
              },
              body: Container(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: TIEU DE
                    Text(
                      doc['title'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 30
                        ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      doc['tinhhuyenxa'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300
                        ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),

                    //TODO: LOAI PHONG
                    Text(
                      doc['propertyType'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(height: 5,),
                    ListTile(
                      leading: Icon(Icons.people_rounded),
                      dense: true,
                      title: Text(doc['guest'].toString() + '  khách', style: TextStyle(fontSize: 16))
                    ),
                    ListTile(
                      leading: Icon(Icons.bed_rounded),
                      dense: true,
                      title: Text(doc['bedroom']['Beds'].toString() + '  giường', style: TextStyle(fontSize: 16)),
                    ),
                    ListTile(
                      leading: Icon(Icons.bedroom_parent_rounded),
                      dense: true,
                      title: Text(doc['bedroom']['Bedrooms'].toString() + '  phòng ngủ', style: TextStyle(fontSize: 16)),
                    ),
                    ListTile(
                      leading: Icon(Icons.bathtub_rounded),
                      dense: true,
                      title: Text(doc['bedroom']['Bathrooms'].toString() + '  nhà vệ sinh', style: TextStyle(fontSize: 16)),
                    ),
                    Divider(),
                    SizedBox(height: 10,),
                    
                    //TODO: Gioi thieu
                    Text(
                      'Lời giới thiệu',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(height: 9,),
                    Text(
                      doc['description'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 17
                        ),
                    ),


                    Divider(),
                    SizedBox(height: 10,),

                    //TODO: TIEN ICH
                    Text(
                      'Tiện ích',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(height: 9,),
                    ListTile(
                      leading: Icon(Icons.restaurant_rounded),
                      dense: true,
                      enabled: doc['amenities']['Kitchen'] ? true : false,
                      title: Text( 'Nhà bếp', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Kitchen'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.tv_rounded),
                      dense: true,
                      enabled: doc['amenities']['TV'] ? true : false,
                      title: Text( 'TV', style: TextStyle(fontSize: 16, decoration: doc['amenities']['TV'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.sanitizer_rounded),
                      dense: true,
                      enabled: doc['amenities']['Shampoo'] ? true : false,
                      title: Text( 'Dầu gội', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Shampoo'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.hvac_rounded),
                      dense: true,
                      enabled: doc['amenities']['Air conditioning'] ? true : false,
                      title: Text( 'Máy điều hoà', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Air conditioning'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.face_rounded),
                      dense: true,
                      enabled: doc['amenities']['Dryer'] ? true : false,
                      title: Text( 'Máy sấy tóc', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Dryer'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_laundry_service_rounded),
                      dense: true,
                      enabled: doc['amenities']['Washing machine'] ? true : false,
                      title: Text( 'Máy giặc', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Washing machine'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.wifi_rounded),
                      dense: true,
                      enabled: doc['amenities']['Wifi'] ? true : false,
                      title: Text( 'Wifi', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Wifi'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.bedroom_parent_rounded),
                      dense: true,
                      enabled: doc['amenities']['Kitchen'] ? true : false,
                      title: Text( 'Nhà bếp', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Kitchen'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.breakfast_dining_rounded),
                      dense: true,
                      enabled: doc['amenities']['Breakfast'] ? true : false,
                      title: Text( 'Buổi ăn sáng', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Breakfast'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.iron_rounded),
                      dense: true,
                      enabled: doc['amenities']['Iron'] ? true : false,
                      title: Text( 'Bàn là', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Iron'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_rounded),
                      dense: true,
                      enabled: doc['amenities']['Self check-in'] ? true : false,
                      title: Text( 'Self check-in', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Self check-in'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.work_rounded),
                      dense: true,
                      enabled: doc['amenities']['Workspace'] ? true : false,
                      title: Text( 'Khu vực làm việc', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Workspace'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.notification_important_rounded),
                      dense: true,
                      enabled: doc['amenities']['Smoke alarm'] ? true : false,
                      title: Text( 'Chuông báo cháy', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Smoke alarm'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    Divider(),
                    SizedBox(height: 10,),

                    //TODO: TIEN NGHI
                    Text(
                      'Tiện nghi',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(height: 9,),
                    ListTile(
                      leading: Icon(Icons.local_parking_rounded),
                      dense: true,
                      enabled: doc['amenities']['Free parking'] ? true : false,
                      title: Text( 'Bãi đỗ xe miễn phí', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Free parking'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.fitness_center_rounded),
                      dense: true,
                      enabled: doc['amenities']['Gym'] ? true : false,
                      title: Text( 'Gym', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Gym'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.pool_rounded),
                      dense: true,
                      enabled: doc['amenities']['Pool'] ? true : false,
                      title: Text( 'Hồ bơi', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Pool'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.elevator_rounded),
                      dense: true,
                      enabled: doc['amenities']['Elevator'] ? true : false,
                      title: Text( 'Thang máy', style: TextStyle(fontSize: 16, decoration: doc['amenities']['Elevator'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),



                    Divider(),
                    SizedBox(height: 10,),

                    //TODO: TIEN NGHI
                    Text(
                      'Vị trí',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(height: 9,),
                    Text(
                      doc['address'].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 17
                        ),
                    ),
                    Text(
                      doc['tinhhuyenxa'].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 17
                        ),
                    ),
                    
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),

                    //TODO: TIEN NGHI
                    Text(
                      'Nội qui',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(height: 9,),
                    ListTile(
                      leading: Text('Checkin:', style: TextStyle(fontSize: 16)),
                      dense: true,
                      title: Text(doc['checkin'].toString(), style: TextStyle(fontSize: 16)),
                    ),
                    ListTile(
                      leading: Text('Checkout:', style: TextStyle(fontSize: 16)),
                      dense: true,
                      title: Text(doc['checkout'].toString(), style: TextStyle(fontSize: 16)),
                    ),
                    ListTile(
                      leading: Icon(Icons.pets_rounded),
                      dense: true,
                      enabled: doc['houseRules']['Pets allowed'] ? true : false,
                      title: Text( 'Cho phép thú nuôi', style: TextStyle(fontSize: 16, decoration: doc['houseRules']['Pets allowed'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.celebration_rounded),
                      dense: true,
                      enabled: doc['houseRules']['Event allowed'] ? true : false,
                      title: Text( 'Cho phép tổ chức tiệt', style: TextStyle(fontSize: 16, decoration: doc['houseRules']['Event allowed'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Icon(Icons.smoking_rooms_rounded),
                      dense: true,
                      enabled: doc['houseRules']['Smoking allowed'] ? true : false,
                      title: Text( 'Cho phép hút thuốc', style: TextStyle(fontSize: 16, decoration: doc['houseRules']['Smoking allowed'] ? TextDecoration.none : TextDecoration.lineThrough)),
                    ),
                    ListTile(
                      leading: Text('Khác:', style: TextStyle(fontSize: 16)),
                      dense: true,
                      title: Text(doc['additionalRules'].toString(), style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ));
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(NumberFormat.currency(locale: 'vi', symbol:'đ/đêm').format(widget.price), 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          Container (
              width: 190,
              height: 40,
              child: TextButton(      
              onPressed: (){
              }, 
              child: Text('Đặt phòng'),
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: kPrimaryColor)
                        )
                      )
                    )
            ),
              ),
              SizedBox(width:15)
          ],
        ),
      )
    );
  }
}