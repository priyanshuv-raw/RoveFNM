import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/screens/onBoardingPage2.dart';
import 'package:rove/utils/colors.dart';

class BoardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // color: Colors.red,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/bus.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Rove",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "We make your daily travel easy with Rove where you can track your daily ride, on your finger tips.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BoardingPage2(),
                          ),
                        );
                      },
                      myButtonColor: AppColors.secondaryColor,
                      myButtonText: "Continue",
                      myButtonTextColor: Colors.white)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
