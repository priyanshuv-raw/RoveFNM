import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: 1400,
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
              "Irure veniam dolore pariatur ad ullamco fugiat est exercitation culpa excepteur. Quis culpa ut amet veniam duis adipisicing eu quis. Culpa labore labore enim sunt labore in duis excepteur. Consectetur et ex sint aute irure duis velit id culpa in dolor. Qui enim sint nulla veniam anim dolor aliqua reprehenderit nulla Lorem culpa quis sunt ex. Commodo cillum minim cupidatat ut. Et qui sint ea cupidatat officia mollit reprehenderit reprehenderit laborum est do consequat voluptate voluptate.Qui qui ex aliquip exercitation irure exercitation qui consectetur culpa in proident. Cupidatat incididunt sit mollit dolore voluptate mollit qui do irure nostrud irure ullamco ipsum cillum. Qui voluptate aute id aliquip adipisicing voluptate aliquip minim proident culpa.Id laborum nostrud nisi consectetur sint culpa id dolore pariatur id aute. Laboris incididunt cillum aute sit ut do qui ad ea non adipisicing enim minim consectetur. Sint non amet id anim magna labore aliquip id elit eiusmod aliquip est. Ex velit id magna culpa anim deserunt in. Eiusmod aliquip consectetur occaecat eu pariatur culpa ut anim Lorem nisi cillum consequat. Voluptate reprehenderit reprehenderit fugiat aliquip veniam exercitation Lorem sit nostrud qui minim et labore. Ipsum sint pariatur in in.Esse anim fugiat sit mollit ex ut. Sint excepteur eiusmod duis enim enim. Quis eu ullamco ex deserunt velit consequat enim sint do ea non id nisi elit. Do minim Lorem nisi sint tempor consectetur anim deserunt qui eu ex. Velit aute nulla amet ut enim laboris tempor officia exercitation aliquip nostrud laboris. Est proident ea tempor id ut ullamco. Duis minim minim eu aute deserunt culpa.Exercitation nisi esse dolore voluptate. Excepteur excepteur exercitation fugiat nostrud culpa enim est eiusmod non. Consequat id eu eu esse incididunt qui laboris excepteur cillum officia magna laborum ex enim.Nostrud ea elit dolor est duis consectetur laboris amet deserunt. Ex adipisicing officia magna commodo amet in velit reprehenderit nostrud commodo. Tempor mollit eu eu eu aliqua aute id labore excepteur excepteur consectetur pariatur duis aliquip.",
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
