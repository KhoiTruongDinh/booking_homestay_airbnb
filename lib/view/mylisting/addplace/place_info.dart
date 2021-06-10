import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class PlaceInfo extends StatefulWidget {
  @override
  PlaceInfoState createState() => PlaceInfoState();
}

class PlaceInfoState extends State<PlaceInfo> {

  static final formKey = GlobalKey<FormState>();
  final guest = new TextEditingController(text: '1');

  String type;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    guest.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Form(
            key: formKey,
            //autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  SizedBox(height: 5),

                  // TODO: title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Tên',
                            hintText: 'Tên nơi ở của bạn',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Bắt buộc có tên!";
                            } else return null;
                          },
                          onSaved: (String value) {
                            context.read<Place>().setTitle = value;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  //TODO: nhap so luong GUEST
                  Row(
                    children: [
                      Icon(
                        Icons.people_rounded,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: TextFormField(
                            controller: guest,
                            //initialValue: context.watch<Place>().toString(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Số lượng người ở',
                              hintText: 'Số lượng người ở',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            validator: (value) {
                              if (value.trim().isEmpty || int.parse(value) == 0) {
                                return "Số lượng người ở chưa nhập!";
                              } else return null;
                            }
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          Provider.of<Place>(context,listen:false).setUpGuest();
                          guest.text = context.read<Place>().guest.toString();
                        },
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: kPrimaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          context.read<Place>().setDownGuest();
                          guest.text = context.read<Place>().guest.toString();
                        },
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  //TODO: pricing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Giá',
                            hintText: 'Giá cho thuê',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty || int.parse(value) == 0) {
                              return "Vui lòng nhập giá thuê!";
                            } else return null;
                          },
                          onSaved: (value){
                            context.read<Place>().setPricing = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  //TODO: type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home_work_rounded,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: Consumer<Place>(builder: (_, provider, __){
                          return InputDecorator(
                              decoration: InputDecoration(
                                hintText: 'Loại nhà ở của bạn',
                                labelText: 'Loại nhà',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration.collapsed(hintText: ''),
                              isExpanded: true,
                              value: provider.propertyType == null ? 'Toàn bộ ngôi nhà' : type,
                              icon: const Icon(Icons.expand_more_rounded),
                              onChanged: (String newValue) {
                                type = newValue;
                                provider.setPropertyType(newValue);
                                //print(newValue);
                              },
                              validator: (value) => value == null ? 'Không được để trống' : null,
                              items: provider.types
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  //TODO: description
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: 'Lời giới thiệu',
                            hintText: 'Giới thiệu ngắn gọn...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Không được để trống";
                            } else return null;
                          },
                          onSaved: (value){
                            context.read<Place>().setDescription = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )
        ),
      );
    }
}
