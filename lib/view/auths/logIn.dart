
import 'package:booking_homestay_airbnb/view/homepage/Home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'signUp.dart';


class Login extends StatefulWidget
{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
{
  bool _showpass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _usernameErr = 'Tài khoản không hợp lê';
  var _passErr = 'Mật khẩu không hợp lệ';
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,

                    ),
                    child: FlutterLogo(),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                  child: Text("Đăng nhập", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
                  child: TextField(
                    controller: _userController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "  Email",

                        errorText: _userInvalid ? _usernameErr : null,
                        labelStyle: TextStyle(color: Colors.black, fontSize: 20),

                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blue, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(

                          controller: _passController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: !_showpass,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: "Mật khẩu",
                              errorText: _passInvalid ? _passErr : null,
                              labelStyle: TextStyle(color: Colors.black, fontSize: 20,),

                              border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.blue, width: 3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              )
                          ),

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: ShowPass,
                          child: Text(_showpass ? 'HIDE' : 'SHOW',
                            style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: SizedBox(
                    width: 250,
                    height: 50,

                    child: RaisedButton(

                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      onPressed: onSignClick,
                      child: Text('Đăng nhập', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: Container(
                      height: 70,
                      width:  double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          RichText(text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                              },
                            text: "Đăng ký",
                            style: TextStyle(color: Colors.blue,fontSize: 15),
                          ),
                          ),

                          RichText(text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){},
                            text: "Quên mật khẩu",
                            style: TextStyle(color: Colors.blue,fontSize: 15),
                          ),
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
  void ShowPass (){
    setState(() {
      _showpass = !_showpass;
    });

  }

  void onSignClick (){
    setState(() {
      if (_userController.text.length < 6)
      {
        _userInvalid = true;
      }
      else{
        _userInvalid = false;
      }
      if (_passController.text.length < 6)
      {
        _passInvalid = true;
      }
      else{
        _passInvalid = false;
      }
      if (!_userInvalid && !_passInvalid)
      {
        Navigator.push(context, MaterialPageRoute(builder: gotoHomePage));
      }
    });
  }
  Widget gotoHomePage(BuildContext context)
  {
    return HomeScreen();
  }
}