import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';
import 'package:http/http.dart' as http;
import 'package:rove/utils/userData.dart';

class RouteMapWidget extends StatefulWidget {
  @override
  _RouteMapWidgetState createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends State<RouteMapWidget> {
  Future<List<dynamic>> _fetchStoppages() async {
    final response = await http.get(
        Uri.parse('http://travel-made-easy.onrender.com/v1/route/stoppages'));

    if (response.statusCode == 200) {
      final stoppagesData = jsonDecode(response.body);
      print(stoppagesData);
      return stoppagesData;
    } else {
      throw Exception('Failed to load stoppages');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 580,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<List<dynamic>>(
          future: _fetchStoppages(), // Replace with your actual loading logic
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final stoppage = snapshot.data![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: MyTextSpace(
                            myMainText: "⚫️ " + stoppage['name'],
                            myMainTextColor: AppColors.primaryColor),
                        // trailing: MyTextSpace(
                        //     myMainText: "Time $index",
                        //     myMainTextColor: AppColors.secondaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(23.0, 0.0, 0.0, 0.0),
                        child: (index < (snapshot.data!.length - 1))
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
