import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        onTap: (){},
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
                              Text(document['title']),
                              Text(document['tinhhuyenxa']),
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