import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/screens/loginPage.dart';
import 'package:rove/screens/onBoardingPage3.dart';
import 'package:rove/utils/colors.dart';

class BoardingPage2 extends StatelessWidget {
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
                image: AssetImage("assets/images/map.png"),
                width: 300,
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Spot your bus like never before",
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
                "We got you covered spotting your bus accurately over the map",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  myButtonColor: Color.fromARGB(255, 219, 219, 219),
                  myButtonText: "Skip",
                  myButtonTextColor: AppColors.primaryColor),
              SizedBox(
                height: 20,
              ),
              MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BoardingPage3(),
                      ),
                    );
                  },
                  myButtonColor: AppColors.primaryColor,
                  myButtonText: "Continue",
                  myButtonTextColor: Colors.white)
            ],
          ),
        )),
      ),
    );
  }
}
