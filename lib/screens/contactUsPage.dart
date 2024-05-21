import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/customs/contactUs.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';
import 'dart:async';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _showSuccessText = false;

  @override
  void dispose() {
    _nameController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: CustomAppBar(
            myUserImage: "assets/images/priyanshu.jpg",
            onNotificationTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            onMenuTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextSpace(
                        myMainText: "Contact Us",
                        myMainTextColor: AppColors.primaryColor),
                    SizedBox(
                      height: 20,
                    ),
                    ContactUs(
                      nameController: _nameController,
                      subjectController: _subjectController,
                      messageController: _messageController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: () {
                        _nameController.clear();
                        _subjectController.clear();
                        _messageController.clear();
                        _showSuccessMessage();
                      },
                      myButtonColor: AppColors.primaryColor,
                      myButtonText:
                          _showSuccessText ? "✅ Message Submitted" : "Submit",
                      myButtonTextColor: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessMessage() {
    setState(() {
      _showSuccessText = true;
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        _showSuccessText = false;
      });
    });
  }
}
