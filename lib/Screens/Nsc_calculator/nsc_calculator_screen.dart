import 'dart:math'; // Import the math library for pow function

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:loan_calculation/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:loan_calculation/AdPlugin/Ads/Native/NativeRN.dart';

class nsc_calculator_screen extends StatefulWidget {
  static const routeName = '/nsc_calculator_screen';

  const nsc_calculator_screen({super.key});

  @override
  State<nsc_calculator_screen> createState() => _nsc_calculator_screenState();
}

class _nsc_calculator_screenState extends State<nsc_calculator_screen> {
  final TextEditingController _depositController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  double _totalAmount = 0.0;
  double _totalInterest = 0.0;
  double _maturityAmount = 0.0;
  int touchedIndex = -1;

  void _calculate() {
    FocusScope.of(context).unfocus();
    double depositAmount = double.tryParse(_depositController.text) ?? 0.0;
    double interestRate = double.tryParse(_interestController.text) ?? 0.0;

    if (depositAmount > 0 && interestRate > 0) {
      int years = 5;
      double totalAmount = depositAmount * pow((1 + interestRate / 100), years);
      double totalInterest = totalAmount - depositAmount;
      double maturityAmount = totalAmount;

      setState(() {
        _totalAmount = totalAmount - totalInterest;
        _totalInterest = totalInterest;
        _maturityAmount = maturityAmount;
      });
    }
  }

  void resetFields() {
    setState(() {
      _depositController.clear();
      _interestController.clear();
      _totalAmount = 0.0;
      _totalInterest = 0.0;
      _maturityAmount = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('National Saving Certificate (Nsc)'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _depositController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Deposit Amount (₹)',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter the Deposit Amount (₹)",
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
                  controller: _interestController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Interest Rate (%)',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter the Interest Rate (%)",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Term",
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        fontWeight: FontWeight.bold,
                        color: HexColor('008080'),
                      ),
                    ),
                    Text(
                      "5 Years",
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        fontWeight: FontWeight.bold,
                        color: HexColor('008080'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.r),
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
                              _calculate();
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
                if (_totalAmount > 0)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 200.r,
                            width: 180.r,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                                    });
                                  },
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 30,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20.r,
                                    width: 20.r,
                                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                  Text(
                                    "Deposit Amount",
                                    style: GoogleFonts.lato(
                                      fontSize: 14.r,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('008080'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.r),
                              Row(
                                children: [
                                  Container(
                                    height: 20.r,
                                    width: 20.r,
                                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange.shade800,
                                    ),
                                  ),
                                  Text(
                                    "Interest Rate",
                                    style: GoogleFonts.lato(
                                      fontSize: 14.r,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('008080'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      NativeRN(parentContext: context),
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
                                "Maturity Amount",
                                style: GoogleFonts.lato(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('008080'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "₹ ${_maturityAmount.toStringAsFixed(2)}",
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
                                "Total Interest",
                                style: GoogleFonts.lato(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('008080'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "₹ ${_totalInterest.toStringAsFixed(2)}",
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
                                "Total Amount",
                                style: GoogleFonts.lato(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('008080'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "₹ ${_totalAmount.toStringAsFixed(2)}",
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
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.orange.shade800,
        value: _totalInterest,
        title: '${((_totalInterest / _maturityAmount) * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 0 ? 60.r : 50.r,
        titlePositionPercentageOffset: 0.5,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 0 ? 20.r : 14.r,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
      PieChartSectionData(
        color: Colors.blue.shade800,
        value: _depositController.text.isNotEmpty ? double.parse(_depositController.text) : 0.0,
        title: '${((double.parse(_depositController.text) / _maturityAmount) * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 1 ? 60.r : 50.r,
        titlePositionPercentageOffset: 0.5,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 1 ? 20.r : 14.r,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    ];
  }
}
