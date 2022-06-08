import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imobile_techs/registerScrren.dart';
import 'package:imobile_techs/webview.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  Future<void> _launched;
  String _launchUrl = "http://imobiletechs.ouctus-platform.com";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Color.fromRGBO(105, 111, 119, 1),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0,top: 70),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: 290,
                    padding: EdgeInsets.only(left: 22,right: 22),
                    margin: EdgeInsets.only(top: 20.0),
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
                      "Sign In iMobileTechs",
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
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
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

                                        /*suffixIcon: IconButton(
                                          icon: Icon(
                                            _showPassword
                                                ? Icons.lock_open_rounded
                                                : Icons.lock,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _showPassword = !_showPassword;
                                            });
                                          },
                                        ),*/
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
                  SizedBox(
                    height: 20,
                  ),
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
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xff0D426C)),
                    ),
                    onTap: () {
                      /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctxt) => PasswordPage()));*/
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member yet?",
                          style: TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => RegisterPage()));
                          },
                          child: Text(
                            "Sign up today for free",
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
            ),
          ),
        ],
      ),
    );
  }
}

