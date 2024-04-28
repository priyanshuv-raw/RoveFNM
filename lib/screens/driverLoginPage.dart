import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/screens/driverHomeScreen.dart';
import 'package:rove/screens/userType.dart';
import 'package:rove/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:rove/utils/config.dart';
import 'package:rove/utils/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageDriver extends StatefulWidget {
  @override
  _LoginPageDriverState createState() => _LoginPageDriverState();
}

class _LoginPageDriverState extends State<LoginPageDriver> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  bool _isLoading = false;
  String _errorMessage = '';
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(loginURL),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);

        var userEmail =
            jsonResponse['user'] != null ? jsonResponse['user']['email'] : '';
        var userName =
            jsonResponse['user'] != null ? jsonResponse['user']['name'] : '';

        // // Store user-specific data in shared preferences
        var accessToken = jsonResponse['tokens']['access']['token'];
        var refreshToken = jsonResponse['tokens']['refresh']['token'];

        preferences.setString('userRole', jsonResponse['user']['role']);
        preferences.setBool(
            'isEmailVerified', jsonResponse['user']['isEmailVerified']);

        preferences.setString('userPhone', jsonResponse['user']['phone']);

        preferences.setString('userId', jsonResponse['user']['id']);
        preferences.setString(
            'accessExpires', jsonResponse['tokens']['access']['expires']);
        preferences.setString(
            'refreshExpires', jsonResponse['tokens']['refresh']['expires']);

        // // Update the UserData class
        UserData.userRole = jsonResponse['user']['role'];
        UserData.isEmailVerified = jsonResponse['user']['isEmailVerified'];
        UserData.userEmail = jsonResponse['user']['email'];
        UserData.userName = jsonResponse['user']['name'];
        UserData.userPhone = jsonResponse['user']['phone'];
        UserData.userId = jsonResponse['user']['id'];
        UserData.accessToken = jsonResponse['tokens']['access']['token'];
        UserData.accessExpires = jsonResponse['tokens']['access']['expires'];
        UserData.refreshToken = jsonResponse['tokens']['refresh']['token'];
        UserData.refreshExpires = jsonResponse['tokens']['refresh']['expires'];
        UserData.userIsLoggedIn = true;
        print(UserData.userEmail);

        if (accessToken != null &&
            refreshToken != null &&
            userEmail.isNotEmpty &&
            userName.isNotEmpty) {
          print("RESPONSE CODE - 200");

          // var SharedPref = await SharedPreferences.getInstance();
          // SharedPref.setBool(MyAppState.KEY_LOGIN_STATUS, true);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => DriverHomeScreen(),
            ),
            (route) => false, // Clear the stack
          );
        } else {
          print("Invalid Data in Response");
          setState(() {
            _errorMessage = "Invalid Data in Response";
          });
        }
      } else {
        print("Invalid Credentials");
        setState(() {
          _errorMessage = "Invalid Credentials";
        });
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 60, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Rove",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Welcomes You",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Image(
                            image: AssetImage("assets/images/driverLogin.png"),
                            width: 250,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: emailController,
                            // keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.red),
                              errorText:
                                  _isNotValidate ? "Enter a valid email" : null,
                              labelText: "E-Mail",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            // keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.red),
                              errorText: _isNotValidate
                                  ? "Enter a valid password"
                                  : null,
                              labelText: "Password",
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 10),
                        MyButton(
                            onTap: () {
                              loginUser();
                            },
                            myButtonColor: AppColors.primaryColor,
                            myButtonText: "Log In",
                            myButtonTextColor: Colors.white),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserType(),
                        ),
                        (route) => false, // Clear the stack
                      );
                    },
                    style: TextButton.styleFrom(
                      // padding: EdgeInsets.fromLTRB(130, 0, 0, 0),
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text(
                      'Change Login Type',
                      style:
                          TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                  )
                ],
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
