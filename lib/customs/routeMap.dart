import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class RouteMapWidget extends StatefulWidget {
  @override
  _RouteMapWidgetState createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends State<RouteMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: Future.delayed(
              Duration(seconds: 2)), // Replace with your actual loading logic
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: MyTextSpace(
                            myMainText: "⚫️ Stop $index",
                            myMainTextColor: AppColors.primaryColor),
                        trailing: MyTextSpace(
                            myMainText: "Time $index",
                            myMainTextColor: AppColors.secondaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(23.0, 0.0, 0.0, 0.0),
                        child: (index < 9)
                            ? Container(
                                height: 40,
                                width: 2,
                                color: AppColors.primaryColor,
                              )
                            : Container(),
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}




// class RouteMapWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       height: 550,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//         border: Border.all(width: 2.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context, index) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   leading: MyTextSpace(
//                       myMainText: "⚫️ Stop $index",
//                       myMainTextColor: AppColors.primaryColor),
//                   trailing: MyTextSpace(
//                       myMainText: "Time $index",
//                       myMainTextColor: AppColors.secondaryColor),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(23.0, 0.0, 0.0, 0.0),
//                   child: (index < 9)
//                       ? Container(
//                           height: 40,
//                           width: 2,
//                           color: AppColors.primaryColor,
//                         )
//                       : Container(),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
