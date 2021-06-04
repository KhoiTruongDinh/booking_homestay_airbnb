
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'logIn.dart';

class SignUp extends StatefulWidget
{

  @override
  _SignUpState createState() =>_SignUpState();

}


class _SignUpState extends State<SignUp>
{

  final formStateKey = GlobalKey<FormState>(); // tạo GlobalKey cho form
  User user = User(); // tạo object User

  final cleartextName = TextEditingController();
  final cleartextPass = TextEditingController();
  final cleartextMail = TextEditingController();
  final cleartextPhone = TextEditingController();
  clearTextInput()
  {
    cleartextName.clear();
    cleartextPass.clear();
    cleartextMail.clear();
    cleartextPhone.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(

            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 5,),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Đăng ký tài khoản',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Form(
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
                              onSaved: saveTen,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
                              controller: cleartextPass,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: 'Vui lòng nhập đúng mật khẩu',
                                  labelText: 'Mật khẩu',
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 3),
                                      borderRadius: BorderRadius.all(Radius.circular(20)))
                              ),
                              validator: validatePass,
                              onSaved: savePass,
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
                              onSaved: saveMail,
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
                              onSaved: savePhone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // sử dụng SizedBox để tạo một khoảng space giữa Button và Form

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          child: Text('Đăng ký',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(20.0),
                            side: BorderSide(color: Colors.white),
                          ),
                          hoverColor: Colors.indigo,
                          onPressed: submitForm,
                        ),
                      ),


                      // RaisedButton(
                      //     child: Text('Hủy'),
                      //
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadiusDirectional.circular(20.0),
                      //       side: BorderSide(color: Colors.red),
                      //     ),
                      //     hoverColor: Colors.pink,
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) => Login()),
                      //       );
                      //     }
                      // )
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
  void saveTen(String inputName) {
    user.name = inputName; // lưu tên vào biến user
  }

  void savePass(String inputPass) {
    user.pass = inputPass; // lưu passwork vào biến user
  }
  void saveMail(String inputMail)
  {

    user.mail = inputMail;
  }
  void savePhone(String inputPhone)
  {
    user.phone = inputPhone;
  }



  String validateTen(String inputName) {
    if (inputName.isEmpty) {
      // String khác null, đồng nghĩa với validate lỗi, đây cũng chính là nội dung lỗi
      return 'Tên không được trống';
    } else {
      // String trả về là null, đồng nghĩa với validate thành công
      return null;
    }
  }

  String validatePass(String inputPass) {
    if (inputPass.isEmpty) {
      return 'Chưa nhập mật khẩu bạn ơi';
    } else {
      return null;
    }
  }
  String validateMail(String inputMail)
  {
    if (inputMail.isEmpty) {
      return 'Chưa nhập Mail bạn ơi';
    } else {
      return null;
    }
  }
  String validatePhone(String inputPhone) {
    if (inputPhone.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    else
    {
      return null;
    }
  }
  void submitForm() {
    if (formStateKey.currentState.validate()) { // hàm validate trả về true là thành công, false là thất bại
      print('Trước khi save: Tên: ${user.name}, Password: ${user.pass}, Mail: ${user.mail} và Phone: ${user.phone}');
      formStateKey.currentState.save(); // khi form gọi hàm save thì tất cả các TextFormField sẽ gọi hàm save
      print('Sau khi save: Tên: ${user.name}, Password: ${user.pass}, Mail: ${user.mail} và Phone: ${user.phone}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      print('Validate thất bại. Vui lòng thử lại');
    }
  }
}

class User {
  User({this.name, this.pass, this.mail, this.phone});

  String name;
  String pass;
  String mail;
  String phone;
}

