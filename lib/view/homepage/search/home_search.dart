import 'package:booking_homestay_airbnb/models/location_address.dart';
import 'package:booking_homestay_airbnb/view/homepage/search/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: TypeAheadField<SearchAddress>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Bạn sắp đi đâu?',
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await context.read<Address>().getSuggestions(pattern);
              },
              itemBuilder: (context, SearchAddress suggestion) {
                final address = suggestion;

                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.location_on_rounded,
                    ),
                  ),
                  title: Text(address.name),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                child: Center(
                  child: Text(
                    '...',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              onSuggestionSelected: (SearchAddress suggestion) {
                Navigator.push(
                          context,
                          MaterialPageRoute( builder: (context) => Result(query: suggestion.code, address: suggestion.name,),
                        ),
                  );
              },

            ),
          )
      ),
    );
  }
}
