import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class sip_calculator extends StatefulWidget {
  static const routeName = '/sip_calculator';

  const sip_calculator({super.key});

  @override
  State<sip_calculator> createState() => _sip_calculatorState();
}

class _sip_calculatorState extends State<sip_calculator> {
  final TextEditingController depositAmountController = TextEditingController();
  final TextEditingController returnInterestRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController monthsController = TextEditingController();
  double totalInvestment = 0.0;
  double totalInterest = 0.0;
  double maturityAmount = 0.0;
  String result = "";
  int touchedIndex = -1;

  void calculateSIP() {
    FocusScope.of(context).unfocus();
    double monthlyInvestment = double.tryParse(depositAmountController.text) ?? 0;
    double annualRate = double.tryParse(returnInterestRateController.text) ?? 0;
    int years = int.tryParse(yearsController.text) ?? 0;
    int months = int.tryParse(monthsController.text) ?? 0;

    int totalMonths = (years * 12) + months;
    double monthlyRate = annualRate / 12 / 100;

    if (monthlyInvestment > 0 && annualRate > 0 && totalMonths > 0) {
      // SIP Maturity Amount Formula
      maturityAmount = monthlyInvestment * ((pow(1 + monthlyRate, totalMonths) - 1) / monthlyRate) * (1 + monthlyRate);

      // Total Investment
      totalInvestment = monthlyInvestment * totalMonths;

      // Total Interest Earned
      totalInterest = maturityAmount - totalInvestment;

      setState(() {
        result = "success";
      });
    }
  }

  void resetFields() {
    setState(() {
      depositAmountController.clear();
      returnInterestRateController.clear();
      yearsController.clear();
      monthsController.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIP Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              TextField(
                controller: depositAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Monthly Investment',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffix: Text(
                    "₹",
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  hintText: "Enter Monthly Investment",
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
                controller: returnInterestRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Annual Return Rate (%)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffix: Text(
                    "%",
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  hintText: "Enter Annual Return Rate",
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
                    child: TextField(
                      controller: yearsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Years',
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            color: HexColor('008080'),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Years",
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
                          borderSide: BorderSide(color: Colors.black54, width: 1.w),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      controller: monthsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Months',
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            color: HexColor('008080'),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Months",
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
                  ),
                ],
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
                      onTap: calculateSIP,
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
              result == 'success'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Total Investment",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "₹ ${totalInvestment.toStringAsFixed(2)}",
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
                                  "₹ ${totalInterest.toStringAsFixed(2)}",
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
                                  "₹ ${maturityAmount.toStringAsFixed(2)}",
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

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.orange.shade800,
        value: totalInterest,
        title: '${((totalInterest / maturityAmount) * 100).toStringAsFixed(1)}%',
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
        value: totalInvestment,
        title: '${((totalInvestment / maturityAmount) * 100).toStringAsFixed(1)}%',
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
