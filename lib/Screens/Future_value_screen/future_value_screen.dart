import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class future_value_screen extends StatefulWidget {
  static const routeName = '/future_value_screen';

  const future_value_screen({super.key});

  @override
  State<future_value_screen> createState() => _future_value_screenState();
}

class _future_value_screenState extends State<future_value_screen> {
  final TextEditingController presentValueController = TextEditingController();
  final TextEditingController inflationRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  String result = '';
  String futureValueResult = "";
  String inflationImpactResult = "";
  String presentValueResult = "";

  void calculateFutureValue() {
    FocusScope.of(context).unfocus();
    double presentValue = double.tryParse(presentValueController.text) ?? 0;
    double inflationRate = double.tryParse(inflationRateController.text) ?? 0;
    int years = int.tryParse(yearsController.text) ?? 0;

    if (presentValue > 0 && inflationRate > 0 && years > 0) {
      double futureValue = presentValue * pow(1 + (inflationRate / 100), years);
      double inflationImpact = futureValue - presentValue;

      setState(() {
        futureValueResult = "${futureValue.toStringAsFixed(2)}";
        inflationImpactResult = "${inflationImpact.toStringAsFixed(2)}";
        presentValueResult = "${presentValue.toStringAsFixed(2)}";
        setState(() {
          result = 'success';
        });
      });
    }
  }

  void resetFields() {
    setState(() {
      presentValueController.clear();
      inflationRateController.clear();
      yearsController.clear();
      futureValueResult = "";
      inflationImpactResult = "";
      presentValueResult = "";
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Value Calculator")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: presentValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Present Value (₹)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Present Value",
                  hintStyle: GoogleFonts.lato(
                    fontSize: 12.r,
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: HexColor('008080'),
                      width: 1.5.w,
                    ),
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
                controller: inflationRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Inflation Rate (%)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Inflation Rate (%)",
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
                controller: yearsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Terms',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Number of Years",
                  hintStyle: GoogleFonts.lato(
                    fontSize: 12.r,
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: HexColor('008080'),
                      width: 1.5.w,
                    ),
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
                      onTap: calculateFutureValue,
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
              SizedBox(height: 10.r),
              result == 'success'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 1.sw,
                          margin: EdgeInsets.only(top: 20.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            color: HexColor('008080').withOpacity(0.1),
                            border: Border.all(color: HexColor('008080'), width: 1.w),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Future Value",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "₹ ${futureValueResult}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1.sw,
                          margin: EdgeInsets.only(top: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            color: HexColor('008080').withOpacity(0.1),
                            border: Border.all(color: HexColor('008080'), width: 1.w),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Present Value",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "₹ ${presentValueResult}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1.sw,
                          margin: EdgeInsets.only(top: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            color: HexColor('008080').withOpacity(0.1),
                            border: Border.all(color: HexColor('008080'), width: 1.w),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Inflation",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "₹ ${inflationImpactResult}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
