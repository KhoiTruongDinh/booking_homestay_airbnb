import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:booking_homestay_airbnb/view/place_info/infoplace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../constants.dart';
import 'addplace/stepper.dart';
import 'package:provider/provider.dart';

class ListPlace extends StatefulWidget {

  @override
  _ListPlaceState createState() => _ListPlaceState();
}

class _ListPlaceState extends State<ListPlace> {
  String host;

  @override
  Widget build(BuildContext context) {
    host = context.read<AuthService>().user;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
              StreamBuilder(
              stream: FirebaseFirestore.instance.collection('place').where('host',isEqualTo:host).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),);
                  }
                  return ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: snapshot.data.docs.map((document) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute( builder: (context) => PlaceDetails(id: document.id,),
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
            ),
    
            
            TextButton.icon(              
              icon: Icon(Icons.add),
              onPressed: (){
                Future.delayed(Duration.zero, () async {
                    context.read<Place>().create();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => Uistepper(),
                    ),
                  );
              }, 
              label: Text('Thêm chỗ ở'),
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white10),
                      foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: kPrimaryColor)
                        )
                      )
                    )
            )
          ],
        ),
      ),
    );
  }
}