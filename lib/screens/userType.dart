import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/screens/driverLoginPage';
import 'package:rove/screens/userLoginPage.dart';
import 'package:rove/utils/colors.dart';

class UserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage("assets/images/userType.png"),
                width: 300,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "How do you want to continue as",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You can login as a driver or a traveller, select one to continue ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 60,
              ),
              MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageDriver(),
                      ),
                    );
                  },
                  myButtonColor: AppColors.primaryColor,
                  myButtonText: "Driver 🚍",
                  myButtonTextColor: Colors.white),
              SizedBox(
                height: 20,
              ),
              MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageTraveller(),
                      ),
                    );
                  },
                  myButtonColor: AppColors.primaryColor,
                  myButtonText: "Traveller 🧍‍♂️",
                  myButtonTextColor: Colors.white)
            ],
          ),
        )),
      ),
    );
  }
}
