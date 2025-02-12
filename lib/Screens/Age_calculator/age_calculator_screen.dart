// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:loan_calculation/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:loan_calculation/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:loan_calculation/AdPlugin/Ads/Native/NativeRN.dart';

class age_calculator_screen extends StatefulWidget {
  static const routeName = '/age_calculator_screen';

  const age_calculator_screen({super.key});

  @override
  State<age_calculator_screen> createState() => _age_calculator_screenState();
}

class _age_calculator_screenState extends State<age_calculator_screen> {
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  String ageResult = '';
  int years = 0;
  int months = 0;
  int days = 0;
  int totalDays = 0;
  int totalMonths = 0;
  int totalWeeks = 0;
  int totalHours = 0;
  int totalMinutes = 0;
  int totalSeconds = 0;

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(1900),
      lastDate: today,
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _calculateAge() {
    FocusScope.of(context).unfocus();
    years = today.year - selectedDate!.year;
    months = today.month - selectedDate!.month;
    days = today.day - selectedDate!.day;

    if (days < 0) {
      months--;
      final previousMonth = DateTime(today.year, today.month, 0);
      days += previousMonth.day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    final Duration difference = today.difference(selectedDate!);
    totalDays = difference.inDays;
    totalMonths = (years * 12) + months;
    totalWeeks = (totalDays / 7).floor();
    totalHours = difference.inHours;
    totalMinutes = difference.inMinutes;
    totalSeconds = difference.inSeconds;
    setState(() {
      ageResult = "success";
    });
  }

  void resetFields() {
    setState(() {
      ageResult = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Age Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: selectedDate != null ? DateFormat('dd/MM/yyyy').format(today) : '',
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Today's Date",
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "${DateFormat('dd/MM/yyyy').format(today)}",
                    hintStyle: GoogleFonts.lato(
                      fontSize: 14.r,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: HexColor('008080'), width: 1.5.w),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.r),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: selectedDate != null ? DateFormat('dd/MM/yyyy').format(selectedDate!) : '',
                  ),
                  keyboardType: TextInputType.number,
                  onTap: _pickDate,
                  decoration: InputDecoration(
                    label: Text(
                      'Date of Birth',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      size: 25.r,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Select Date",
                    hintStyle: GoogleFonts.lato(
                      fontSize: 12.r,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: HexColor('008080'), width: 1.5.w),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.r),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: resetFields,
                        child: Container(
                          height: 50.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(width: 1.w, color: HexColor('008080')),
                          ),
                          child: Center(
                            child: Text(
                              'Reset',
                              style: GoogleFonts.lato(
                                fontSize: 18.r,
                                color: HexColor('008080'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          AdsRN().showFullScreen(
                            context: context,
                            onComplete: () {
                              _calculateAge();
                            },
                          );
                        },
                        child: Container(
                          height: 50.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: HexColor('008080'),
                          ),
                          child: Center(
                            child: Text(
                              'Calculate',
                              style: GoogleFonts.lato(
                                fontSize: 18.r,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.r),
                ageResult == 'success'
                    ? Container(
                        width: 1.sw,
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: HexColor('008080').withOpacity(0.1),
                          border: Border.all(color: HexColor('008080'), width: 1.w),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Age",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                            SizedBox(height: 10.r),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Years",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${years}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Months",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${months}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Days",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${days}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                NativeRN(parentContext: context),
                ageResult == 'success'
                    ? Container(
                        width: 1.sw,
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: HexColor('008080').withOpacity(0.1),
                          border: Border.all(color: HexColor('008080'), width: 1.w),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Years",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${years}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total Months",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${totalMonths}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.r),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Weeks",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${totalWeeks}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total Days",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${totalDays}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.r),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Hours",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${totalHours}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total Minutes",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${totalMinutes}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.r),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Seconds",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${totalSeconds}",
                                        style: GoogleFonts.lato(
                                          fontSize: 14.r,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
