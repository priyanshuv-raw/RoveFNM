import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class TodaysRide extends StatelessWidget {
  final String myFromLocation;
  final String myToLocation;
  final String myBusNumber;
  final String myBusETA;

  const TodaysRide({
    super.key,
    required this.myFromLocation,
    required this.myToLocation,
    required this.myBusNumber,
    required this.myBusETA,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 187,
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: AppColors.primaryColor, // Border color
          width: 2.0, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   height: 10,
            //   width: 10,
            //   color: AppColors.accentColor,
            // ),
            Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 70,
                  width: 2,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myFromLocation,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  myToLocation,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  myBusNumber,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  myBusETA,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
