import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week3task2/api.dart';
import 'package:week3task2/pagehome.dart';
import 'package:week3task2/register.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum statusLogin { signIn, notSignIn }

class _MyAppState extends State<MyApp> {
  statusLogin _loginStatus = statusLogin.notSignIn;
  final _keyForm = GlobalKey<FormState>();
  String nUsername, nPassword;

  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataLogin();
    }
  }

  submitDataLogin() async {
    final responseData =
        await http.post(GetLinknya.linknya + "login.php", body: {
      "username": nUsername,
      "password": nPassword,
    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
    print("data login $data");
// get data respon
    String dataUsername = data['username'];
    String dataEmail = data['email'];
    String dataAlamat = data['alamat'];
    String dataSex = data['sex'];
    String dataFullname = data['full_name'];
    String dataTanggalDaftar = data['tgl_daftar'];
    String dataIdUser = data['id_user'];
    String dataGambar = data['gambar'];

// cek value 1 atau 0
    if (value == 1) {
      setState(() {
// set status loginnya sebagai login
        _loginStatus = statusLogin.signIn;
        // simpan data ke share preferences
        saveDataPref(value, dataIdUser, dataUsername, dataEmail, dataAlamat,
            dataSex, dataFullname, dataTanggalDaftar, dataGambar);
      });
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
    }
  }

  saveDataPref(int value, String dIdUser, dUsername, dEmail, dAlamat, dSex,
      dFullName, dCreated, dGambar) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("username", dUsername);
      sharedPreferences.setString("id_user", dIdUser);
      sharedPreferences.setString("email", dEmail);
      sharedPreferences.setString("alamat", dAlamat);
      sharedPreferences.setString("sex", dSex);
      sharedPreferences.setString("full_name", dFullName);
      sharedPreferences.setString("tgl_daftar", dCreated);
      sharedPreferences.setString("gambar", dGambar);
    });
  }

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      int nvalue = sharedPreferences.getInt("value");
      _loginStatus = nvalue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });
  }

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", null);
      //sharedPreferences.commit();
      _loginStatus = statusLogin.notSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Center(
              child: Text(
                'Login Form',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Form(
            key: _keyForm,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  'gambar/kesehatan.png',
                  height: 200.0,
                  width: 200.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 70, 15, 5),
                  child: TextFormField(
                    validator: (value) {
//cek kalau value nya kosong
                      if (value.isEmpty) {
                        return 'Please Input Username';
                      }
                      return null;
                    },
                    onSaved: (value) => nUsername = value,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.lightGreen, width: 2.5),
                        ),
                        hintText: 'Username',
                        labelText: 'Input Username',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Input Password';
                      }
                      return null;
                    },
                    onSaved: (value) => nPassword = value,
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.lightGreen, width: 2.5),
                        ),
                        hintText: 'Password',
                        labelText: 'Input Password',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30.0, 30, 0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.green,
                    elevation: 8,
                    height: 40,
                    textColor: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      setState(() {
                        checkForm();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  child: MaterialButton(
                    textColor: Colors.redAccent,
                    child: Text(
                      'Belum Punya Akun ?  Silahkan Daftar',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageRegister()));
                    },
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return PageHome(signOut);
        break;
      default:
        return null;
    }
  }
}
