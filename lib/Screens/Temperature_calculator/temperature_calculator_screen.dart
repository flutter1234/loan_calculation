// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class temperature_calculator_screen extends StatefulWidget {
  static const routeName = '/temperature_calculator_screen';

  const temperature_calculator_screen({super.key});

  @override
  State<temperature_calculator_screen> createState() => _temperature_calculator_screenState();
}

class _temperature_calculator_screenState extends State<temperature_calculator_screen> {
  final TextEditingController _celsiusController = TextEditingController();
  String result = '';
  double celsius = 0.0;
  double fahrenheit = 0.0;
  double kelvin = 0.0;
  double rankine = 0.0;

  void _calculateTemperature() {
    FocusScope.of(context).unfocus();
    celsius = double.tryParse(_celsiusController.text) ?? 0;
    setState(() {
      fahrenheit = (celsius * 9 / 5) + 32;
      kelvin = celsius + 273.15;
      rankine = (celsius + 273.15) * 9 / 5;
      result = 'success';
    });
  }

  void resetFields() {
    setState(() {
      _celsiusController.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _celsiusController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Temperature (in Celsius)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Degrees",
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
                      onTap: _calculateTemperature,
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
                                      "Celsius",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "$celsius °C",
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
                                      "Fahrenheit",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${fahrenheit.toStringAsFixed(2)} °F",
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
                                      "Kelvin",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${kelvin.toStringAsFixed(2)} K",
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
                                      "Rankine",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.r,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('008080'),
                                      ),
                                    ),
                                    SizedBox(height: 5.r),
                                    Text(
                                      "${rankine.toStringAsFixed(2)} °R",
                                      style: GoogleFonts.lato(
                                        fontSize: 14.r,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
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
