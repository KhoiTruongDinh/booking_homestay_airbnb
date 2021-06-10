import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class BedRoom extends StatefulWidget {


  @override
  BedRoomState createState() => BedRoomState();
}

class BedRoomState extends State<BedRoom> {

  final beds = new TextEditingController(text: '1');
  final bedroom = new TextEditingController(text: '1');
  final bathroom = new TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          SizedBox(height: 20),
          //TODO: beds
          Row(
            children: [
              Icon(
                Icons.bed_rounded,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                    controller: beds,
                    //initialValue: context.watch<Place>().toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Số gường',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),                    
                ),
              ),
              IconButton(
                onPressed: (){
                  Provider.of<Place>(context,listen:false).setUpBedRoom('Beds');
                  beds.text = context.read<Place>().getBedRoom('Beds').toString();
                },
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: kPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: (){
                  Provider.of<Place>(context,listen:false).setDownBedRoom('Beds');
                  beds.text = context.read<Place>().getBedRoom('Beds').toString();
                },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),

          SizedBox(height: 20),

          //TODO: beds
          Row(
            children: [
              Icon(
                Icons.bedroom_parent_rounded,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  controller: bedroom,
                  //initialValue: context.watch<Place>().toString(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Số phòng',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: (){
                  Provider.of<Place>(context,listen:false).setUpBedRoom('Bedrooms');
                  bedroom.text = context.read<Place>().getBedRoom('Bedrooms').toString();
                },
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: kPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: (){
                  Provider.of<Place>(context,listen:false).setDownBedRoom('Bedrooms');
                  bedroom.text = context.read<Place>().getBedRoom('Bedrooms').toString();
                },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          SizedBox(height: 20),

          //TODO: beds
          Row(
            children: [
              Icon(
                Icons.bathtub_rounded,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  controller: bathroom,
                  //initialValue: context.watch<Place>().toString(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Số nhà vệ sinh',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: (){
                  Provider.of<Place>(context,listen:false).setUpBedRoom('Bathrooms');
                  bathroom.text = context.read<Place>().getBedRoom('Bathrooms').toString();
                },
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: kPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: (){
                  Provider.of<Place>(context,listen:false).setDownBedRoom('Bathrooms');
                  bathroom.text = context.read<Place>().getBedRoom('Bathrooms').toString();
                },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          SizedBox(height: 20),
        ]
    );
  }
}
