import 'package:booking_homestay_airbnb/models/location.dart';
import 'package:booking_homestay_airbnb/models/location_address.dart';
import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class location extends StatefulWidget {

  @override
  locationState createState() => locationState();
}

class locationState extends State<location> {
  static final formKey = GlobalKey<FormState>();

  Province _provinceSelected; // = Province(name_with_type: 'Vui lòng chọn tỉnh/tp', districts: []);
  District _districtSelected; // = District(name_with_type: 'Vui lòng chọn quận/huyện', wards: []);
  Wards _wardsSelected;

  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //_provinceList = context.watch<Address>().provinceList;
    //});
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        child: Form(
          key: formKey,

          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Container(
                width: double.infinity,
                height: 60.0,
                child: DropdownButtonFormField<Province>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      hint: Text('Vui lòng chọn tỉnh/tp'),
                      value: _provinceSelected,
                      items: context.read<Address>().provinceList.map((p) {
                        return DropdownMenuItem<Province>(
                          child: Text(p.name_with_type),
                          value: p,
                        );
                      }).toList(),
                      onChanged: (p) {
                        setState(() {
                          _provinceSelected = p;
                          _districtSelected = null;
                          _wardsSelected = null;
                        });
                      },
                  onSaved: (p){
                        context.read<Place>().setTinh = p.code;
                  },
                    validator: (value) => value == null ? 'Không được để trống' : null,
                  )
                ),

            SizedBox(height: 20),

            Container(
                height: 60.0,
                width: double.infinity,
                child: DropdownButtonFormField<District>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    hint: Text('Vui lòng chọn quận/huyện'),
                    value: _districtSelected,
                    items: (_provinceSelected ?? Province(districts: [])).districts.map((d) {
                      return DropdownMenuItem<District>(
                        child: Text(d.name_with_type),
                        value: d,
                      );
                    }).toList(),
                    onChanged: (d) {
                      setState(() {
                        _districtSelected = d;
                        _wardsSelected = null;
                      });
                    },
                  onSaved: (p){
                    context.read<Place>().setHuyen = p.code;
                  },
                  validator: (value) => value == null ? 'Không được để trống' : null,)),

            SizedBox(height: 20),

            Container(
                height: 60.0,
                width: double.infinity,
                child: DropdownButtonFormField<Wards>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    hint: Text('Vui lòng chọn phường/xã'),
                    value: _wardsSelected,
                    items: (_districtSelected ?? District(wards: [])).wards.map((w) {
                      return DropdownMenuItem<Wards>(
                        child: Text(w.name_with_type),
                        value: w,
                      );
                    }).toList(),
                    onChanged: (w) {
                      setState(() {
                        _wardsSelected = w;
                      });},
                    onSaved: (value){
                      context.read<Place>().setXa = value.code;
                      context.read<Place>().setTinhHuyenXa = value.path_with_type;
                    },
                    validator: (value) => value == null ? 'Không được để trống' : null,
                )),
            SizedBox(height: 20),

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
                      labelText: 'Địa chỉ chi tiết',
                      hintText: 'Số nhà, tên đường...',
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
                      context.read<Place>().setAddress = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ]),
        ));
  }
}
