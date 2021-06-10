import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Facilities extends StatefulWidget {

  @override
  FacilitiesState createState() => FacilitiesState();
}

class FacilitiesState extends State<Facilities> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Bãi đỗ xe miễn phí'),
                secondary:Icon(
                  Icons.local_parking_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Free parking'),
                onChanged: (bool value) {
                  provider.setAmenities('Free parking', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Gym'),
                secondary:Icon(
                  Icons.fitness_center_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Gym'),
                onChanged: (bool value) {
                  provider.setAmenities('Gym', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Hồ bơi'),
                secondary:Icon(
                  Icons.pool_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Pool'),
                onChanged: (bool value) {
                  provider.setAmenities('Pool', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Thang máy'),
                secondary:Icon(
                  Icons.elevator_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Elevator'),
                onChanged: (bool value) {
                  provider.setAmenities('Elevator', value);}
            );
          },
          ),

        ],
      ),
    );
  }
}
