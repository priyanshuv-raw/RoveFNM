import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class TodaysRide extends StatelessWidget {
  final String myStartLocation;
  final String myEndLocation;
  final String myDepartureTime;
  final String myArrivalTime;
  final String myBusSeats;

  const TodaysRide({
    super.key,
    required this.myStartLocation,
    required this.myEndLocation,
    required this.myDepartureTime,
    required this.myArrivalTime,
    required this.myBusSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 237,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextSpace(
                    myMainText: "⚫️ $myStartLocation",
                    myMainTextColor: AppColors.primaryColor),
                MyTextSpace(
                    myMainText: "Dep - $myDepartureTime",
                    myMainTextColor: AppColors.primaryColor)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 2,
                color: AppColors.primaryColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextSpace(
                    myMainText: "⚫️ $myEndLocation",
                    myMainTextColor: AppColors.primaryColor),
                MyTextSpace(
                    myMainText: "ETA - $myArrivalTime",
                    myMainTextColor: AppColors.primaryColor)
              ],
            ),
            SizedBox(
              height: 26,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(width: 1.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  color: AppColors.primaryColor,
                  Icons.train,
                ),
                MyTextSpace(
                    myMainText: "Bus Number",
                    myMainTextColor: AppColors.primaryColor),
                MyTextSpace(
                    myMainText: "$myBusSeats",
                    myMainTextColor: AppColors.primaryColor),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
