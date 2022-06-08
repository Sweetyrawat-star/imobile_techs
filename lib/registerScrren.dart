import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imobile_techs/LoginScreen.dart';
import 'package:imobile_techs/webview.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String _name;
  String password;
  String email;
  var data;
  var d;
  bool _isChecked = true;
  String _currText = '';
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  Future<void> _launched;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Color.fromRGBO(105, 111, 119, 1),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80.0,
                width: 290,
                padding: EdgeInsets.only(left: 22,right: 22),
                //margin: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/imobiletechs-logo-icon.png",
                          height: 120,
                        ),
                        Image.asset(
                          "assets/imobiletechs-logo-text.png",
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Register with iMobileTechs",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("First Name* "),
                            SizedBox(height: 10.0,),
                            Theme(
                              data: new ThemeData(
                                primaryColor: Colors.lightBlueAccent,
                              ),
                              child: Container(
                                height: 40,
                                child: TextFormField(
                                  controller: firstName,
                                  keyboardType: TextInputType.name,
                                  onSaved: (val) => email = val,
                                  // initialValue: "abc",

                                  validator: (val) {
                                    return val.length < 1 ? "Required" : null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.black
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: 'First Name',
                                    // suffixIcon: Icon(Icons.mail,color: Colors.grey,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 70,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Last Name*"),
                            SizedBox(height: 10,),
                            Theme(
                              data: new ThemeData(
                                primaryColor: Colors.lightBlueAccent,
                              ),
                              child: Container(
                                height: 40,
                                child: TextFormField(
                                  onSaved: (val) => password = val,
                                  validator: (val) {
                                    return val.length < 1 ? "Required" : null;
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: lastName,
                                 /* obscureText:
                                  !_showPassword, *///This will obscure text dynamically
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        //width: 0.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        // width: 0.0
                                      ),
                                    ),
                                    hintText: 'Last Name',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 70,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email* "),
                            SizedBox(height: 10.0,),
                            Theme(
                              data: new ThemeData(
                                primaryColor: Colors.lightBlueAccent,
                              ),
                              child: Container(
                                height: 40,
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (val) => email = val,
                                  // initialValue: "abc",

                                  validator: (val) {
                                    return val.length < 1 ? "Required" : null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.black
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: 'Email',
                                    // suffixIcon: Icon(Icons.mail,color: Colors.grey,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 70,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password*"),
                            SizedBox(height: 10,),
                            Theme(
                              data: new ThemeData(
                                primaryColor: Colors.lightBlueAccent,
                              ),
                              child: Container(
                                height: 40,
                                child: TextFormField(
                                  onSaved: (val) => password = val,
                                  validator: (val) {
                                    return val.length < 1 ? "Required" : null;
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: passwordController,
                                  obscureText:
                                  !_showPassword, //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        //width: 0.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        // width: 0.0
                                      ),
                                    ),
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:15,right: 15),
                //color: Colors.red,
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                          if (val == true) {}
                        });
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "I have read and agree to the Terms and Conditions",
                          style: TextStyle(color: Color(0xff0D426C),fontSize: 12),
                        ),
                        Text( "of iMobileTechs and understand that my information",style: TextStyle(color: Color(0xff0D426C),fontSize: 12),),
                        Text("will be used in accordance with the iMobileTechs",style: TextStyle(color: Color(0xff0D426C),fontSize: 12),),
                        Text(" Privacy Statement",style: TextStyle(color: Color(0xff0D426C),fontSize: 12),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*SizedBox(
                height: 10,
              ),*/
              Container(
                height: 40,
                width: 120,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> WebsitePage()));
                  },
                  textColor: Colors.white,
                  color: Color(0xff0D426C),
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    "Sign in Now",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Color(0xff0D426C)),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

