import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';
import 'package:hr_emp_proj/models/working_hours_models.dart' as models;
import 'package:hr_emp_proj/models/working_hours_models.dart';
import 'package:hr_emp_proj/ui/widgets/fl_charts/bar_graph.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/configuration.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Map<String, dynamic>> workingHoursDetail = [];
  Map<dynamic, dynamic> weekWiseWorkingHours = {};

  @override
  void initState() {
    getWorkingHorsApi();

    super.initState();
  }

  var data;

  Future<dynamic> getWorkingHorsApi() async {
    final response = await http.get(
        Uri.parse(
          'http://hrm.manxel.com/api/app/get_worked_hours',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 832|eoSTkvRLa0tLZoQfSRgmZh7tnpOdVLbWgbY1BSVw5d6c555a'
          // Add other headers as needed
        });

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      setState(() {});
      return data;
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'hello World',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data == null
                ? const CircularProgressIndicator()
                : Container(
                    height: context.getScreenHeight * 0.28,
                    width: context.getScreenWidth * 0.95,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            color: Colors.grey.shade100,
                            blurRadius: 10,
                          ),
                        ],
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: MyBarGraph(
                      monthlySummary: <double>[
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['MON']
                                  [1] ??
                              0,
                        ),
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['TUE']
                                  [1] ??
                              0,
                        ),
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['WED']
                                  [1] ??
                              0,
                        ),
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['THU']
                                  [1] ??
                              0,
                        ),
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['FRI']
                                  [1] ??
                              0,
                        ),
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['SAT']
                                  [1] ??
                              0,
                        ),
                        double.parse(
                          data['responseData']['weekWiseWorkedHours']['SUN']
                                  [1] ??
                              0,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
