import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Place with ChangeNotifier{
  String _title;
  int _guest;
  String _description;
  String _location;
  int _pricing;
  String _propertyType;
  Map<String, int> _bedroom;
  Map<String, bool> _amenities;
  Map<String, bool> _houseRules;

  String _tinh;
  String _huyen;
  String _xa;
  String _tinhhuyenxa;
  String _address;

  String _checkin;
  String _checkout;
  String _additionalRules;

  String _pic;

  List<String> _types = ['Phòng khách sạn','Phòng riêng','Toàn bộ ngôi nhà'];

  //Place(){    print('provider place');  }
  // TODO constructors create
  void create(){
    _title = null;
    _guest = 1;
    _description = null;
    _location = null;
    _pricing = 0;
    _propertyType = 'Toàn bộ ngôi nhà';
    //
    _bedroom = {'Beds' : 1, 'Bedrooms' : 1, 'Bathrooms' : 1 };
    //
    _amenities = {
      'Kitchen' : false,
      'Shampoo' : false,
      'Air conditioning' : false,
      'Washing machine' : false,
      'Dryer' : false,
      'Wifi' : false,
      'Breakfast' : false,
      'Iron' : false,
      'Workspace' : false,
      'Self check-in' : false,
      'Smoke alarm' : false,
      'TV' : false,

      'Free parking' : false,
      'Gym' : false,
      'Pool' : false,
      'Elevator' : false,
    };

    _houseRules = {
      'Pets allowed' : false,
      'Smoking allowed' : false,
      'Event allowed' : false,
    };

    _checkin = 'ví dụ';
    _checkout = null;
    _additionalRules = null;

    _pic = null;
    //notifyListeners();
  }

  // TODO: getter
  String get title => _title;
  int get guest => _guest;
  String get description => _description;
  String get location => _location;
  int get pricing => _pricing;
  String get propertyType => _propertyType;

  String get checkin => _checkin;
  String get checkout => _checkout;
  String get AdditionalRules => _additionalRules;

  String get urlPic => _pic;
  List<String> get types => _types;

  bool getAmenities(String index){
    return _amenities[index];
  }

  int getBedRoom(String index){
    return _bedroom[index];
  }

  dynamic getHouseRule(String index){
    return _houseRules[index];
  }


  String get tinhAddress => _tinh;
  String get huyenAddress => _huyen;
  String get xaAdress => _xa;
  String get tinhHuyenXa => _tinhhuyenxa;
  String get address => _address;


  //TODO setter
  set setTitle(String title) {_title = title;}
  //set setGuest(int guest) {_guest = guest;}
  set setDescription(String content) {_description = content; }
  set setLocation(String location) {_location = location;}
  set setPricing(int pr) {_pricing = pr; }

  set setTinh(String value) { _tinh = value; }
  set setHuyen(String value) {_huyen = value; }
  set setXa(String value) { _xa = value; }
  set setTinhHuyenXa(String value) {_tinhhuyenxa = value; }
  set setAddress(String value) {_address = value; }

  set setCheckIn(String value) {_checkin = value; }
  set setCheckOut (String value) {_checkout = value; }
  set setAdditionalRules (String value) {_additionalRules = value;}

  set setUrlPic (String value) {_pic = value; }
  void setPropertyType(String index){
    _propertyType = index;
    notifyListeners();
  }

  void setAmenities(String index, bool value){
    _amenities[index] = value;
    notifyListeners();
  }

  void setBedRoom(String index, int value){
    _bedroom[index] = value;
    notifyListeners();
  }

  void setUpBedRoom(String index){
    _bedroom[index] ++;
    notifyListeners();
  }

  void setDownBedRoom(String index){
    if (_bedroom[index] == 1)
      return;
    _bedroom[index] --;
    notifyListeners();
  }

  void setUpGuest(){
    _guest ++;
    notifyListeners();
  }

  void setDownGuest(){
    if (_guest == 1)
      return;
    _guest --;
    notifyListeners();
  }

  void setHouseRule(String index, dynamic value){
    _houseRules[index] = value;
    notifyListeners();
  }


  Future<String> creatPlace(String host) async{
    try {
      await FirebaseFirestore.instance.collection("place").add({
        'host': host,
        'title': _title,
        'guest': _guest,
        'pricing': _pricing,
        'description': _description,
        'location': _location,
        'propertyType': _propertyType,
        'bedroom': _bedroom,
        'amenities': _amenities,
        'houseRules': _houseRules,
        'tinh': _tinh,
        'huyen': _huyen,
        'xa': _xa,
        'tinhhuyenxa': _tinhhuyenxa,
        'address': _address,
        'checkin': _checkin,
        'checkout': _checkout,
        'additionalRules': _additionalRules,
        'pic': _pic
      }).then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    catch(e){
      print(e.toString());
      return e.code;
    }
    return 'true';
  }
}