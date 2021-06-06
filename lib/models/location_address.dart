import 'dart:convert';

import 'package:booking_homestay_airbnb/models/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class Address with ChangeNotifier{
  List<Province> _provinceList = [];

  List<SearchAddress> _provinceSearch = [];
  List<SearchAddress> _districtSearch = [];
  List<SearchAddress> _wardsSearch = [];

  List<Province> get provinceList => _provinceList;

  List<SearchAddress> getSuggestions(String query)
  {
    String queryLower = query.toLowerCase();
    List<SearchAddress> suggestions = [];
    var vd = _provinceSearch.where((p) => p.name.contains(queryLower)).toList();
    suggestions..addAll(vd);
    vd = _districtSearch.where((p) => p.name.contains(queryLower)).toList();
    suggestions..addAll(vd);
    vd = _wardsSearch.where((p) => p.name.contains(queryLower)).toList();
    suggestions..addAll(vd);
    return suggestions.take(30).toList();
  }

  Address.instance()
  {
    _loadViAddressDb();
    print('load json');
  }

  Future _loadViAddressDb() async {
    try{
      String data = await rootBundle.loadString("assets/vn_db.json");
      Map jsonResult = json.decode(data);

      jsonResult.forEach((k, item) {
        Province provice = Province.fromJson(item);
        List<District> districtList = [];
        Map.castFrom(item['quan-huyen']).forEach((k2, item2) {
          District district = District.fromJson(item2);
          List<Wards> wardsList = [];
          Map.castFrom(item2['xa-phuong']).forEach((k3, item3) {
            Wards ward = Wards.fromJson(item3);
            _wardsSearch.add(SearchAddress(ward.code,ward.path_with_type.toLowerCase()));
            wardsList.add(ward);
          });
          _districtSearch.add(SearchAddress(district.code,district.path_with_type.toLowerCase()));
          district.wards = wardsList;
          districtList.add(district);
        });
        _provinceSearch.add(SearchAddress(provice.code,provice.name_with_type.toLowerCase()));
        provice.districts = districtList;
        _provinceList.add(provice);
      });
    }
    catch (e){
      print(e);
    }
  }
}
class SearchAddress{
  String code;
  String name;

  SearchAddress(this.code,this.name);
}