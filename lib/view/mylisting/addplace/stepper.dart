import 'dart:core';
import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'addphoto.dart';
import 'amenities.dart';
import 'facilities.dart';
import 'house_rules.dart';
import 'place_info.dart';
import 'stepper_bedroom.dart';
import 'stepper_location.dart';

class Uistepper extends StatefulWidget {
  const Uistepper({Key key}) : super(key: key);

  @override
  _UistepperState createState() => _UistepperState();
}

class _UistepperState extends State<Uistepper> {
  int currStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String host;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    host= context.read<AuthService>().user;
    List<Step> steps = [
      Step(
          title: Text('Thông tin chung'),
          subtitle: Text('Tên, giá nhà, giới thiệu,...'),
          isActive: true,
          state: currStep == 0 ? StepState.editing : StepState.indexed,
          content: PlaceInfo()
      ),
      Step(
          title: Text('Vị trí'),
          subtitle: Text('Xác định vị trí ngôi nhà của bạn'),
          isActive: true,
          state: currStep == 1 ? StepState.editing : StepState.indexed,
          content: location()
      ),
      Step(
          title: Text('Phòng và giường'),
          subtitle: Text('Số phòng, giường'),
          isActive: true,
          state: currStep == 2 ? StepState.editing : StepState.indexed,
          content: BedRoom()
      ),
      Step(
          title: Text('Tiện ích'),
          subtitle: Text('Các tiện ích có trong nhà'),
          isActive: true,
          state: currStep == 3 ? StepState.editing : StepState.indexed,
          content: Amenities()
      ),
      Step(
          title: Text('Tiện nghi'),
          subtitle: Text('Những tiện nghi có trong nhà'),
          isActive: true,
          state: currStep == 4 ? StepState.editing : StepState.indexed,
          content: Facilities()
      ),
      Step(
          title: Text('Nội qui nhà'),
          subtitle: Text('Check in, check out,...'),
          isActive: true,
          state: currStep == 5 ? StepState.editing : StepState.indexed,
          content: HouseRule(),
      ),
      Step(
        title: Text('Hình ảnh'),
        subtitle: Text('Thêm hình ảnh ngôi nhà'),
        isActive: true,
        state: currStep == 6 ? StepState.editing : StepState.indexed,
        content: AddPhoto(),
      ),
    ];

    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      ScaffoldMessenger
          .of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() async{
      String k = await context.read<Place>().creatPlace(host);
      if(k == 'true')
        Navigator.pop(context);
      else
        showSnackBarMessage(k);
    }

    return SafeArea(
      child: Scaffold(
        body: Form(
        key: _formKey,
        child: ListView(
            physics : ClampingScrollPhysics(),
            //physics: BouncingScrollPhysics(),
            children: <Widget>[
              Stepper(
                physics: ClampingScrollPhysics(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: onStepCancel,
                        child: const Text('QUAY LẠI'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 25)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0)
                                  )
                              )
                          )
                      ),
                      SizedBox(width: 10),
                      TextButton(
                          onPressed: onStepContinue,
                          child: const Text('TIẾP TỤC'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 25)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0)
                                  )
                              )
                          )
                      ),
                    ],
                  );
                },
                steps: steps,
                type: StepperType.vertical,
                currentStep: this.currStep,
                onStepContinue: () {
                  setState(() {
                    if(currStep == 0 && PlaceInfoState.formKey.currentState.validate()){
                      PlaceInfoState.formKey.currentState.save();
                      currStep = currStep + 1;
                    }
                    else if(currStep == 1 && locationState.formKey.currentState.validate()){
                      locationState.formKey.currentState.save();
                      currStep = currStep + 1;
                    }
                    else if(currStep == 5 && HouseRuleState.formKey.currentState.validate()){
                      HouseRuleState.formKey.currentState.save();
                      currStep = currStep + 1;
                    }
                    else if(currStep == 2 || currStep == 3|| currStep == 4 ){
                      currStep = currStep + 1;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currStep > 0) {
                      currStep = currStep - 1;
                    } else {
                      currStep = 0;
                    }
                  });
                },
              ),
              currStep == 6 ?
              RaisedButton(
                child: new Text(
                  'Lưu',
                  style: new TextStyle(color: Colors.white),
                ),
                onPressed: _submitDetails,
                color: Colors.blue,
              ) : SizedBox(height: 20),
            ]
        ),
        ),
      ),
    );
  }
}

