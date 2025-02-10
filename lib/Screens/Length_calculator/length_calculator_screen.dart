// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class length_calculator_screen extends StatefulWidget {
  static const routeName = '/length_calculator_screen';

  const length_calculator_screen({super.key});

  @override
  State<length_calculator_screen> createState() => _length_calculator_screenState();
}

class _length_calculator_screenState extends State<length_calculator_screen> {
  final TextEditingController _meterController = TextEditingController();
  String result = '';
  double meters = 0.0;
  double centimeters = 0.0;
  double kilometers = 0.0;
  double millimeters = 0.0;
  double micrometers = 0.0;
  double feet = 0.0;
  double inches = 0.0;

  void _calculateLengths() {
    FocusScope.of(context).unfocus();
    final double meters = double.tryParse(_meterController.text) ?? 0;
    centimeters = meters * 100;
    kilometers = meters / 1000;
    millimeters = meters * 1000;
    micrometers = meters * 1e6;
    feet = meters * 3.28084;
    inches = meters * 39.3701;
    setState(() {
      result = 'success';
    });
  }

  void resetFields() {
    setState(() {
      _meterController.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _meterController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Meter',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Value in Meter",
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
              SizedBox(height: 20.h),
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
                      onTap: _calculateLengths,
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
              result == 'success'
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
                                      "Centimeter",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${centimeters.toStringAsFixed(2)}",
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
                                      "Kilometer",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${kilometers.toStringAsFixed(2)}",
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
                                      "Millimetre",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${millimeters.toStringAsFixed(2)}",
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
                                      "Micrometer",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${micrometers.toStringAsFixed(2)}",
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
                                      "Foot",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${feet.toStringAsFixed(2)}",
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
                                      "Inch",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${inches.toStringAsFixed(2)}",
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
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
