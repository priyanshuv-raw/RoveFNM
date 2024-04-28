import 'package:flutter/material.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/screens/profilePage.dart';
import 'package:rove/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String myUserImage;
  final Function()? onNotificationTap;
  final Function()? onMenuTap;

  const CustomAppBar({
    super.key,
    required this.myUserImage,
    required this.onNotificationTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 200,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3), bottomRight: Radius.circular(3))),
      leadingWidth: 100,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        icon: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(myUserImage),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      centerTitle: false,
      title: Text(
        "Hi There 👋🏻",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
            onPressed:() {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => NotificationPage()),
              (route) => route.isFirst,
            );
          },
          icon: Icon(Icons.notifications),
          color: Colors.white,
        ),
        IconButton(
            onPressed:() {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MenuPage()),
              (route) => route.isFirst,
            );
          }, icon: Icon(Icons.menu), color: Colors.white),
      ],
    );
  }
}











//       appBar: AppBar(
//         leadingWidth: 100,
//         leading: IconButton(
//           onPressed: () {},
//           icon: CircleAvatar(
//             radius: 35,
//             backgroundImage: AssetImage(myUserImage),
//           ),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         toolbarHeight: 100,
//         centerTitle: false,
//         title: Text(
//           "Hey There 👋🏻",
//           style: TextStyle(
//               color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.credit_card_outlined),
//             color: Colors.white,
//           ),
//           IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.settings),
//               color: Colors.white),
//         ],
//       ),
//     );
//   }
// }