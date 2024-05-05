import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: 2650,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: AppColors.primaryColor, // Border color
              width: 2.0, // Border width
            ),
          ),
          // child: const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              '''Rove - Travel Made Easy
              
Introduction

At Rove, we are committed to protecting the privacy and security of our users' personal information. This privacy policy outlines how we collect, use, and protect the personal information of our users.

Information We Collect

Rove collects the following types of personal information from our users:

1. Name and Contact Information : We collect users' names and contact information, including email addresses and phone numbers.
2. ID Number : We collect ID numbers provided by the college for identification purposes.
3. Location Data (GPS Coordinates): We collect location data in the form of GPS coordinates to provide real-time bus tracking and suggest alternative buses.
4. Profile Picture and Cover Picture : We collect new profile pictures and cover pictures uploaded by users to update their profiles.

How We Use the Information

Rove uses the collected personal information for the following purposes:

1. Providing Services: We use the information to provide the services of Rove, including real-time bus tracking and suggesting alternative buses.
2. Notification: We use the information to notify our users about the status of the buses.
3. Legal Compliance: We use the information to comply with legal regulations and security measures to authorize the user.
4. Profile Updates: We use the information to update the user's profile picture or cover picture on the application.
5. Location Tracking: Users are required to keep their location on while using Rove to provide accurate location data.

How We Protect User Information

Rove takes the following measures to protect user information:

1. Secure Servers: We store user information on secure servers to prevent unauthorized access.
2. Access Control: We limit access to user information to authorized personnel only.
3.  Regular Monitoring : We regularly monitor and test our security systems to ensure the integrity of user information.

 Disclosure of User Information 

Rove may disclose user information in the following circumstances:

1.  Administrative Purposes : We may disclose user information to our administrators when required by law or for security purposes.
2.  Service Provision : We may share user information with third-party service providers to provide services requested by users, such as sharing live location data with administrators.
3.  Third-Party Disclosure : We do not share or disclose user information related to editing profile pictures or covers to third parties.

 Changes to This Policy 

Rove reserves the right to modify this privacy policy at any time without notice. Users are responsible for reviewing this policy periodically for any changes.

 Contact Us 

If you have any questions or concerns about this privacy policy, please contact us at rove.instance@gmail.com.

 Effective Date 

This privacy policy is effective as of 9th May, 2024 and will remain in effect until modified or replaced.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 86, 86, 86),
              ),
            ),
          )),
    );
  }
}
