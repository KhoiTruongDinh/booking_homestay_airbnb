import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AuthState { initial, authenticated, authenticating, unauthenticated }

class AuthService with ChangeNotifier {

  FirebaseAuth _auth;
  String _user;
  AuthState _authState = AuthState.initial;
  bool _registerState = false;

  String _name;
  String _phone;
  String _email;

  AuthState get authState => _authState;
  String get user => _user;
  bool get registerState => _registerState;
  String get name => _name;
  String get phone => _phone;
  String get email => _email;

  //named constructors
  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null) {
        _authState = AuthState.unauthenticated;
      } else {
        _user = firebaseUser.uid;
        _authState = AuthState.authenticated;
      }
      notifyListeners();
    });
  }
  //Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<String> logIn(String email, String password) async {
    try {
      _authState = AuthState.authenticating; //set current state to loading state.
      notifyListeners();

      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((currentUser)=>{
            FirebaseFirestore.instance.collection('users')
            .doc(currentUser.user.uid)
            .get().then((user) =>{
              _user = user['uid'],
              _email = user['email'],
              _phone = user['phone'],
              _name = user['name'],
              print('user $_user email: $_email name:$_name phone:$_phone')
            }
            )
          });
          

      _authState = AuthState.authenticated; //set current state to loading state.
      notifyListeners();

      return 'true';

    } catch (e) {
      print(e);
      _authState = AuthState.unauthenticated;
      notifyListeners();

      return e.code;
    }
  }

  Future<String> register(String email, String password, String phoneNumber, String name) async {
    try{
      _registerState = true; //set current state to loading state.
      notifyListeners();

      await _auth
          .createUserWithEmailAndPassword(
          email: email,
          password: password)
          .then((currentUser)
      => FirebaseFirestore.instance.collection("users").doc(currentUser.user.uid)
          .set({
        "uid": currentUser.user.uid,
        "name": name,
        "phone": phoneNumber,
        "email": email,
      })
          .then((result) => {
            _user = currentUser.user.uid,
            _name = name,
            _phone = phoneNumber,
            _email = email,
            print('user $_user email: $_email name:$_name phone:$_phone')
      }));

      _registerState = false;
      notifyListeners();
      return 'true';
    } catch (e) {

      print(e.toString());

      _registerState = false; //set current state to loading state.
      notifyListeners();

      return e.code;
    }
  }
  Future logout() async {
    await _auth.signOut();
    _authState = AuthState.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
