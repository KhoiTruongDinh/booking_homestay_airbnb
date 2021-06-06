import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:booking_homestay_airbnb/splash_screen.dart';
import 'package:booking_homestay_airbnb/view/auths/logIn.dart';
import 'package:booking_homestay_airbnb/view/homepage/Home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/location_address.dart';

//import 'view/homepage/Home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService.instance()),
        ChangeNotifierProvider(create: (_) => Place()),
        ChangeNotifierProvider(create: (_) => Address.instance()),
      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirBnB Fake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _showScreen(context),
    );
  }
}

Widget _showScreen (BuildContext context) {
  switch (context.watch<AuthService>().authState) {
    case AuthState.authenticating:
    case AuthState.unauthenticated:
      return Login();
    case AuthState.initial:
      return SplashScreen();
    case AuthState.authenticated:
      return HomeScreen();
  }
  return Container();
}

