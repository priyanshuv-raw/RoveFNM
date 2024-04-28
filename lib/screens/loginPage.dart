import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/screens/homeScreen.dart';
import 'package:rove/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:rove/utils/config.dart';
import 'package:rove/utils/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  bool userIsLoggedIn = false;
  bool _isLoading = false;
  String _errorMessage = '';
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void checkUserLoginStatus() async {
    userIsLoggedIn = UserData.userIsLoggedIn;
    if (userIsLoggedIn) {
      // Navigate to the HomeScreen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false, // Clear the stack
      );
    } else {
      // Navigate to the LoginPage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false, // Clear the stack
      );
    }
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
        userIsLoggedIn = true;
        print(jsonResponse);

        var userEmail =
            jsonResponse['user'] != null ? jsonResponse['user']['email'] : '';
        var userName =
            jsonResponse['user'] != null ? jsonResponse['user']['name'] : '';

        // Store user-specific data in shared preferences
        var accessToken = jsonResponse['tokens']['access']['token'];
        var refreshToken = jsonResponse['tokens']['refresh']['token'];
        preferences.setString('userRole', jsonResponse['user']['role']);
        preferences.setBool(
            'isEmailVerified', jsonResponse['user']['isEmailVerified']);
        preferences.setString('userCourse', jsonResponse['user']['course']);
        preferences.setString('userBranch', jsonResponse['user']['branch']);
        preferences.setInt('userYear', jsonResponse['user']['year']);
        preferences.setString('userRoll', jsonResponse['user']['roll']);
        preferences.setString('userPhone', jsonResponse['user']['phone']);
        preferences.setString('userStoppage', jsonResponse['user']['stoppage']);
        preferences.setString('userId', jsonResponse['user']['id']);
        preferences.setString(
            'accessExpires', jsonResponse['tokens']['access']['expires']);
        preferences.setString(
            'refreshExpires', jsonResponse['tokens']['refresh']['expires']);

        // Update the UserData class
        UserData.userRole = jsonResponse['user']['role'];
        UserData.isEmailVerified = jsonResponse['user']['isEmailVerified'];
        UserData.userEmail = jsonResponse['user']['email'];
        UserData.userName = jsonResponse['user']['name'];
        UserData.userCourse = jsonResponse['user']['course'];
        UserData.userBranch = jsonResponse['user']['branch'];
        UserData.userYear = jsonResponse['user']['year'];
        UserData.userRoll = jsonResponse['user']['roll'];
        UserData.userPhone = jsonResponse['user']['phone'];
        UserData.userStoppage = jsonResponse['user']['stoppage'];
        UserData.userId = jsonResponse['user']['id'];
        UserData.accessToken = accessToken;
        UserData.accessExpires = jsonResponse['tokens']['access']['expires'];
        UserData.refreshToken = refreshToken;
        UserData.refreshExpires = jsonResponse['tokens']['refresh']['expires'];
        UserData.userIsLoggedIn = true;

        if (accessToken != null &&
            refreshToken != null &&
            userEmail.isNotEmpty &&
            userName.isNotEmpty) {
          userIsLoggedIn = true;
          print("RESPONSE CODE - 200");

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                // accessToken: accessToken,
                // refreshToken: refreshToken,
                // email: userEmail,
                // name: userName,
              ),
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
                          height: 20,
                        ),
                        Image(
                          image: AssetImage("assets/images/login.png"),
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
                          height: 20,
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      // padding: EdgeInsets.fromLTRB(130, 0, 0, 0),
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text(
                      'Forgot Password',
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
