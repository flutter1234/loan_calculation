// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class weight_calculator_screen extends StatefulWidget {
  static const routeName = '/weight_calculator_screen';

  const weight_calculator_screen({super.key});

  @override
  State<weight_calculator_screen> createState() => _weight_calculator_screenState();
}

class _weight_calculator_screenState extends State<weight_calculator_screen> {
  final TextEditingController _kgController = TextEditingController();
  String result = '';
  double grams = 0.0;
  double milligrams = 0.0;
  double kilograms = 0.0;
  double micrograms = 0.0;
  double metricTons = 0.0;
  double pounds = 0.0;

  void _calculateWeights() {
    FocusScope.of(context).unfocus();
    kilograms = double.tryParse(_kgController.text) ?? 0;
    grams = kilograms * 1000;
    milligrams = kilograms * 1e6;
    micrograms = kilograms * 1e9;
    metricTons = kilograms / 1000;
    pounds = kilograms * 2.20462;
    setState(() {
      result = 'success';
    });
  }

  void resetFields() {
    setState(() {
      _kgController.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _kgController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Weight (in kg)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Weight",
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
                      onTap: _calculateWeights,
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
                                      "Gram",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${grams.toStringAsFixed(2)}",
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
                                      "Kilogram",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${kilograms.toStringAsFixed(2)}",
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
                                      "Microgram",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${micrograms.toStringAsFixed(2)}",
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
                                      "Milligram",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${milligrams.toStringAsFixed(2)}",
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
                                      "Metric Ton",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${metricTons.toStringAsFixed(2)}",
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
                                      "Pound",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${pounds.toStringAsFixed(2)}",
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
