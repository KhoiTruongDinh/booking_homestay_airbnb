import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Amenities extends StatefulWidget {

  @override
  _AmenitiesState createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Bếp'),
                secondary:Icon(
                  Icons.restaurant_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Kitchen'),
                onChanged: (bool value) {
                  provider.setAmenities('Kitchen', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('TV'),
                secondary:Icon(
                  Icons.tv_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('TV'),
                onChanged: (bool value) {
                  provider.setAmenities('TV', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Dầu gội'),
                secondary:Icon(
                  Icons.sanitizer_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Shampoo'),
                onChanged: (bool value) {
                  provider.setAmenities('Shampoo', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Máy điều hoà'),
                secondary:Icon(
                  Icons.hvac_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Air conditioning'),
                onChanged: (bool value) {
                  provider.setAmenities('Air conditioning', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Máy giặc'),
                secondary:Icon(
                  Icons.local_laundry_service_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Washing machine'),
                onChanged: (bool value) {
                  provider.setAmenities('Washing machine', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Máy sấy tóc'),
                secondary:Icon(
                  Icons.face_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Dryer'),
                onChanged: (bool value) {
                  provider.setAmenities('Dryer', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Wifi'),
                secondary:Icon(
                  Icons.wifi_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Wifi'),
                onChanged: (bool value) {
                  provider.setAmenities('Wifi', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Buổi ăn sáng'),
                secondary:Icon(
                  Icons.breakfast_dining_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Breakfast'),
                onChanged: (bool value) {
                  provider.setAmenities('Breakfast', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Bàn là'),
                secondary:Icon(
                  Icons.iron_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Iron'),
                onChanged: (bool value) {
                  provider.setAmenities('Iron', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Khu vực làm việc'),
                secondary:Icon(
                  Icons.work_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Workspace'),
                onChanged: (bool value) {
                  provider.setAmenities('Workspace', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Self check-in'),
                secondary:Icon(
                  Icons.lock_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Self check-in'),
                onChanged: (bool value) {
                  provider.setAmenities('Self check-in', value);}
            );
          },
          ),

          Consumer<Place>(builder: (_, provider, __){
            return CheckboxListTile(
                title: const Text('Chuông báo cháy'),
                secondary:Icon(
                  Icons.notification_important_rounded,
                ),
                autofocus: false,
                activeColor: Colors.black,
                checkColor: Colors.white,
                dense: true,
                value: provider.getAmenities('Smoke alarm'),
                onChanged: (bool value) {
                  provider.setAmenities('Smoke alarm', value);}
            );
          },
          ),

        ],
      ),
    );
  }
}
