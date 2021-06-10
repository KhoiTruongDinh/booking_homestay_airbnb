import "package:provider/provider.dart";
import 'package:booking_homestay_airbnb/services/authentications.dart';
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

  final formStateKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    _userController.clear();
    _passController.clear();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          padding: const EdgeInsets.fromLTRB(30,30,30,0),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                SizedBox(height: 100),
                Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: FlutterLogo(),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 80),
                  child: Text("Đăng nhập", style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40),
                  ),
                ),

                Form(
                  key: formStateKey,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      TextFormField(
                        controller: _userController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 24, 12, 16),
                          hintText: 'nguyena@gmail.com',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          icon: Icon(Icons.email),
                          labelText: "  Email",
                          //labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blue, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                        ),
                        validator: validateEmail,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: !_showpass,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 24, 12, 16),
                              icon: Icon(Icons.lock),
                              labelText: "Mật khẩu",
                              //labelStyle: TextStyle(color: Colors.black, fontSize: 20,),
                              border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.blue, width: 3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              suffixIcon: IconButton(
                                icon: _showpass ? Icon(Icons.visibility_off_rounded) : Icon(Icons.visibility_rounded),
                                onPressed: showPass,
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Không được để trống';
                            else
                              return null;
                          },
                      )
                    ],
                  ),
                ),

                SizedBox(height: 50),

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
                      onPressed: submitForm,
                      child: Text('Đăng nhập', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ),
                ),

                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                    ..onTap = (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                    text: "Đăng ký",
                    style: TextStyle(color: Colors.blue,fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showPass (){
    setState(() {
      _showpass = !_showpass;
    });

  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return 'Không được để trống';
    }
    else if (!regex.hasMatch(value))
      return 'Vui lòng nhập đúng định dạng';
    else
      return null;
  }

  void submitForm() async{
    if (formStateKey.currentState.validate()) {
      String k = await context.read<AuthService>().logIn(_userController.text, _passController.text);
      switch (k) {
        case 'invalid-email':
          showErrDialog("Vui lòng nhập lại email!");
          break;
        case 'wrong-password':
          showErrDialog("Mật khẩu sai!");
          break;
        case 'user-not-found':
          showErrDialog("Không thấy tài khoản, vui lòng nhập lại email!");
          break;
        case 'user-disabled':
          showErrDialog("Tài khoản đã bị khoá!");
          break;
        case 'too-many-requests':
          showErrDialog("Tài khoản đã đăng nhập!");
          break;
        case 'operation-not-allowed':
          showErrDialog("Không được phép");
          break;
      }
    }
    else {
      print('Validate thất bại. Vui lòng thử lại');
    }
  }
  showErrDialog(String err) {
    // to hide the keyboard, if it is still p
    FocusScope.of(context).requestFocus(new FocusNode());
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Có lỗi!"),
            content: Text(err),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }
}