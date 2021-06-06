
import 'package:booking_homestay_airbnb/services/authentications.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SignUp extends StatefulWidget
{

  @override
  _SignUpState createState() =>_SignUpState();

}
class _SignUpState extends State<SignUp>
{

  final formStateKey = GlobalKey<FormState>(); 

  final cleartextName = TextEditingController();
  final cleartextPass = TextEditingController();
  final cleartextMail = TextEditingController();
  final cleartextPhone = TextEditingController();

  bool _showpass = false;

  @override
  void initState(){
    super.initState();
    cleartextName.clear();
    cleartextPass.clear();
    cleartextMail.clear();
    cleartextPhone.clear();
  }

  @override
  void dispose() {
    cleartextName.dispose();
    cleartextPass.dispose();
    cleartextMail.dispose();
    cleartextPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(

            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2,),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Đăng ký tài khoản',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        //fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 50),

                  Form(
                      key: formStateKey, // gán key cho Form
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: TextFormField(
                              controller: cleartextName,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: 'Vui lòng nhập tên',
                                  labelText: 'Họ và tên',
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 3),
                                      borderRadius: BorderRadius.all(Radius.circular(20)))
                              ),
                              validator: validateTen,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
                              controller: cleartextMail,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: 'Vui lòng nhập mail của bạn',
                                  labelText: 'Mail',
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 3),
                                      borderRadius: BorderRadius.all(Radius.circular(20)))
                              ),
                              validator: validateMail,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
                              obscureText: !_showpass,
                              controller: cleartextPass,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: 'Nhập mật khẩu',
                                  labelText: 'Mật khẩu',
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
                              validator: validatePass,
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              controller: cleartextPhone,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.phone),
                                  hintText: 'Vui lòng nhập số điện thoại',
                                  labelText: 'Số điện thoại',
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black, width: 3),
                                      borderRadius: BorderRadius.all(Radius.circular(20)))
                              ),
                              validator: validatePhone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 30), // sử dụng SizedBox để tạo một khoảng space giữa Button và Form
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: RaisedButton(
                          child: Text(
                            !context.watch<AuthService>().registerState ? 'Đăng ký' : 'Đang đăng ký ...',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          hoverColor: Colors.indigo,
                          onPressed: ()=>{
                            submitForm(cleartextName.text, cleartextPass.text, cleartextMail.text,cleartextPhone.text)
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: RichText(
                        text: TextSpan(
                            text: "Bạn đã có tài khoản?",
                            style: TextStyle(color: Colors.grey, fontSize: 16),

                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (){
                                      Navigator.pop(context);
                                    },
                                  text: "Đăng nhập",
                                  style: TextStyle(color: Colors.blue,fontSize: 16))
                            ]
                        ),
                      )
                  )
                ],
              ),
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

  String validateTen(String inputName) {
    if (inputName.isEmpty) {
      return 'Tên không được trống';
    } else {
      return null;
    }
  }

  String validatePass(String inputPass) {
    if (inputPass.isEmpty) {
      return 'Không được để trống';
    } else {
      return null;
    }
  }
  String validateMail(String value)
  {
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
  String validatePhone(String inputPhone) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (inputPhone.length == 0) {
      return 'Không được để trống';
    }
    else if( inputPhone.length != 10){
      return 'Số điện thoại có 10 số';
    }
    else if (!regExp.hasMatch(inputPhone)) {
      return 'Vui lòng nhập đúng định dạng';
    }
    return null;
  }
  void submitForm(String name, String pass, String email, String sdt) async {
    if (formStateKey.currentState.validate()) {
      String k = await context.read<AuthService>().register(email,pass,sdt,name);
      switch (k) {
        case 'true':
          Navigator.pop(context);
          break;
        case 'invalid-email':
          showErrDialog("Email không hợp lệ!");
          break;
        case 'email-already-in-use':
          showErrDialog("Email này đã có người sử dụng!");
          break;
        case 'weak-password':
          showErrDialog("Vui lòng chọn mật khẩu có tính bảo mật cao hơn! (Hơn 6 ký tự)");
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

