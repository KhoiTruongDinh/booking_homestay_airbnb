import 'package:booking_homestay_airbnb/view/place_info/infoplace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class Result extends StatefulWidget {
  final String query;
  final String address;

  Result({Key key, @required this.query, @required this.address}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    var vd;
    String q = widget.query;
    if (q.length == 2){
      vd = FirebaseFirestore.instance.collection('place').where('tinh',isEqualTo:q).snapshots();
    }
    else if(q.length == 3){
      vd = FirebaseFirestore.instance.collection('place').where('huyen',isEqualTo:q).snapshots();
    }
    else if(q.length == 5){
      vd = FirebaseFirestore.instance.collection('place').where('xa',isEqualTo:q).snapshots();
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
             Text(
               'Kết quả tìm kiếm',
               textAlign: TextAlign.left,
               style: TextStyle(
                 color: kPrimaryColor,
                 fontWeight: FontWeight.normal,
                 fontSize: 28
                 ),
                 ),
            SizedBox(height: 5),
            Text(
              widget.address,
              textAlign: TextAlign.left,
              //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18
                ),
              ),
            SizedBox(height: 20),
              StreamBuilder(
              stream: vd,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),);
                }
                if(snapshot.data == null){
                  return  Text('Không có kết quả!');
                }
                  return ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: snapshot.data.docs.map((document) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute( builder: (context) => PlaceDetails(id: document.id, price: document['pricing'],),
                        ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom:20),
                          child: Card(
                          elevation: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 230,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(document['pic']),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height:10),
                              Text(document['propertyType']),
                              Text(
                                document['title'],
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 23
                                  ),
                                ),
                              Text(
                                document['tinhhuyenxa'],
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis, 
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                  ),),
                              Text(
                                NumberFormat.currency(locale: 'vi', symbol:'đ/đêm').format(document['pricing']),
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17
                                  ),
                                ),
                            ],
                          ),)
                        ),
                      );}
                    ).toList(),
                  );
                },
            )
          ],
        ),
      ),
    ),
      ),
    );
  }
}