import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HouseRule extends StatefulWidget {

  @override
  HouseRuleState createState() => HouseRuleState();
}

class HouseRuleState extends State<HouseRule> {

  static final formKey = GlobalKey<FormState>();
  TextEditingController checkin = TextEditingController();


  @override
  Widget build(BuildContext context) {
    //checkin.text = context.watch<Place>().getAmenities('Check in').toString();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  //controller: new TextEditingController(text: context.watch<Place>().checkin),
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Check in',
                    hintText: 'Cách thức, giờ check-in,...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return "Bắt buộc!";
                    } else return null;
                  },
                  onSaved: (String value) {
                    context.read<Place>().setCheckIn = value;
                  },
                ),
              ),
            ],
          ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20),
                Flexible(
                  child: TextFormField(
                    //controller: new TextEditingController(text: context.watch<Place>().checkin),
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Check out',
                      hintText: 'Cách thức, giờ check-out,...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return "Bắt buộc!";
                      } else return null;
                    },
                    onSaved: (String value) {
                      context.read<Place>().setCheckOut = value;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),

            Consumer<Place>(builder: (_, provider, __){
              return CheckboxListTile(
                  title: const Text('Cho phép thú nuôi'),
                  secondary:Icon(
                    Icons.pets_rounded,
                  ),
                  autofocus: false,
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  dense: true,
                  value: provider.getHouseRule('Pets allowed'),
                  onChanged: (bool value) {
                    provider.setHouseRule('Pets allowed', value);}
              );
            },
            ),

            Consumer<Place>(builder: (_, provider, __){
              return CheckboxListTile(
                  title: const Text('Cho phép tổ chức tiệt'),
                  secondary:Icon(
                    Icons.celebration_rounded,
                  ),
                  autofocus: false,
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  dense: true,
                  value: provider.getHouseRule('Event allowed'),
                  onChanged: (bool value) {
                    provider.setHouseRule('Event allowed', value);}
              );
            },
            ),

            Consumer<Place>(builder: (_, provider, __){
              return CheckboxListTile(
                  title: const Text('Cho phép hút thuốc'),
                  secondary:Icon(
                    Icons.smoking_rooms_rounded,
                  ),
                  autofocus: false,
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  dense: true,
                  value: provider.getHouseRule('Smoking allowed'),
                  onChanged: (bool value) {
                    provider.setHouseRule('Smoking allowed', value);}
              );
            },
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20),
                Flexible(
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nội qui bổ sung',
                      hintText: 'Thêm các nội qui,...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onSaved: (String value) {
                      context.read<Place>().setAdditionalRules = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );

  }
}
