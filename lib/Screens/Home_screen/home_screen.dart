import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/Screens/Age_calculator/age_calculator_screen.dart';
import 'package:loan_calculation/Screens/Business_forecast_calculator/business_forecast_calculator_screen.dart';
import 'package:loan_calculation/Screens/Cost_sold_calculator/cost_of_sold_calculator_screen.dart';
import 'package:loan_calculation/Screens/Discount_calculator/discount_calculator_screen.dart';
import 'package:loan_calculation/Screens/Emi_calculator/emi_calculator.dart';
import 'package:loan_calculation/Screens/Fd_calculator/fd_calculator.dart';
import 'package:loan_calculation/Screens/Future_value_screen/future_value_screen.dart';
import 'package:loan_calculation/Screens/Gross_profit_calculator/gross_profit_calculator_screen.dart';
import 'package:loan_calculation/Screens/Gst_calculator/gst_calculator_screen.dart';
import 'package:loan_calculation/Screens/Length_calculator/length_calculator_screen.dart';
import 'package:loan_calculation/Screens/Loan_compare/loan_compare_screen.dart';
import 'package:loan_calculation/Screens/MIS_calculator/mis_calculator_screen.dart';
import 'package:loan_calculation/Screens/Nsc_calculator/nsc_calculator_screen.dart';
import 'package:loan_calculation/Screens/Rd_calculator/rd_calculator.dart';
import 'package:loan_calculation/Screens/Setting_screen/setting_screen.dart';
import 'package:loan_calculation/Screens/Sip_calculator/sip_calculator.dart';
import 'package:loan_calculation/Screens/Temperature_calculator/temperature_calculator_screen.dart';
import 'package:loan_calculation/Screens/Vat_calculator/vat_calculator_screen.dart';
import 'package:loan_calculation/Screens/Weight_calculator/weight_calculator_screen.dart';

class home_screen extends StatefulWidget {
  static const routeName = '/home_screen';

  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, emi_calculator.routeName);
            },
            child: Container(
              padding: EdgeInsets.only(top: 40.h, left: 15.w, right: 15.w),
              height: 180.r,
              width: 1.sw,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor('28676d'),
                    HexColor('297a67'),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EMI Calculator',
                              style: GoogleFonts.lato(
                                fontSize: 22.r,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Calculate EMI quickly with simple inputs',
                              style: GoogleFonts.lato(
                                fontSize: 10.r,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 80.w,
                          height: 30.r,
                          margin: EdgeInsets.only(bottom: 20.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              '>>>',
                              style: GoogleFonts.lato(
                                fontSize: 22.r,
                                color: HexColor('28676d'),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, setting_screen.routeName);
                        },
                        child: Container(
                          height: 25.r,
                          width: 25.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Icon(
                              Icons.settings,
                              size: 25.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Image(height: 105.r, fit: BoxFit.fill, image: AssetImage('assets/images/emi_calculator.png')),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, fd_calculator.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              height: 100.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('#f79358'),
                                    HexColor('#f05825'),
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'FD\nCalculator',
                                          style: GoogleFonts.lato(
                                            fontSize: 14.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Container(
                                          width: 60.w,
                                          height: 30.r,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '>>>',
                                              style: GoogleFonts.lato(
                                                fontSize: 22.r,
                                                color: HexColor('f79358'),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image(height: 75.r, fit: BoxFit.fill, image: AssetImage('assets/images/FD_calculator.png'))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, rd_calculator.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              height: 100.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('d183ef'),
                                    HexColor('9835c6'),
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'RD\nCalculator',
                                          style: GoogleFonts.lato(
                                            fontSize: 14.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Container(
                                          width: 60.w,
                                          height: 30.r,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '>>>',
                                              style: GoogleFonts.lato(
                                                fontSize: 22.r,
                                                color: HexColor('d183ef'),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image(height: 75.r, fit: BoxFit.fill, image: AssetImage('assets/images/RD_calculator.png'))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.r),
                    Text(
                      'Finance Calculator',
                      style: GoogleFonts.lato(
                        fontSize: 20.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10.r),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, sip_calculator.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        height: 100.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                            colors: [
                              HexColor('fdc440'),
                              HexColor('ec9c0d'),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(height: 100.r, width: 70.w, fit: BoxFit.fill, image: AssetImage('assets/images/SIP_calculator.png')),
                            SizedBox(width: 20.w),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SIP Calculator',
                                        style: GoogleFonts.lato(
                                          fontSize: 18.r,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        'Calculate your SIP instantly with simple inputs!',
                                        style: GoogleFonts.lato(
                                          fontSize: 10.r,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '>>>',
                                      style: GoogleFonts.lato(
                                        fontSize: 22.r,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.r),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, loan_compare_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: HexColor('#e0f7f2'),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.r,
                                    width: 60.r,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#45c1a0'),
                                    ),
                                    child: Image.asset("assets/images/compare_calculator.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Compare Loan\nCalculator',
                                      style: GoogleFonts.lato(
                                        fontSize: 10.r,
                                        color: HexColor('#45c1a0'),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, gst_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: HexColor('#fedde4'),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.r,
                                    width: 60.r,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('ff3934'),
                                    ),
                                    child: Image.asset("assets/images/gst_calculator.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'GST\nCalculator',
                                      style: GoogleFonts.lato(
                                        fontSize: 10.r,
                                        color: HexColor('ff3934'),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, future_value_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: HexColor('#8A2BE2').withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.r,
                                    width: 60.r,
                                    padding: EdgeInsets.all(10.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#8A2BE2'),
                                    ),
                                    child: Image.asset("assets/images/inflation_calculator.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Inflation\nCalculator',
                                      style: GoogleFonts.lato(
                                        fontSize: 10.r,
                                        color: HexColor('#8A2BE2'),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.r),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, vat_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: HexColor('#f0f4c3'),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.r,
                                    width: 60.r,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#8bc34a'),
                                    ),
                                    child: Image.asset("assets/images/vat.calculator.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'VAT\nCalculator',
                                      style: GoogleFonts.lato(
                                        fontSize: 10.r,
                                        color: HexColor('#8bc34a'),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, nsc_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: HexColor('#f0f8ff'),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.r,
                                    width: 60.r,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('20B2AA'),
                                    ),
                                    child: Image.asset("assets/images/nsc_calculator.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'National Saving\nCertificate',
                                      style: GoogleFonts.lato(
                                        fontSize: 10.r,
                                        color: HexColor('20B2AA'),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, mis_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: HexColor('#D81B60').withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.r,
                                    width: 60.r,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#D81B60'),
                                    ),
                                    child: Image.asset("assets/images/mis_calculator.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Monthly Income\nScheme',
                                      style: GoogleFonts.lato(
                                        fontSize: 10.r,
                                        color: HexColor('#D81B60'),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.r),
                    Text(
                      'Business Calculator',
                      style: GoogleFonts.lato(
                        fontSize: 20.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, gross_profit_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                              height: 80.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('#FF6F61'), // Vibrant Coral
                                    HexColor('#D7263D'), // Bold Crimson Red
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 55.r,
                                    width: 55.r,
                                    padding: EdgeInsets.all(5.r),
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#34D399'), // Fresh Mint Green
                                    ),
                                    child: Image.asset("assets/images/month_calculator.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Gross Profit\nCalculator',
                                          style: GoogleFonts.lato(
                                            fontSize: 12.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '>>>',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.r,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, cost_of_sold_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                              height: 80.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('#0072ff'), // Electric Blue
                                    HexColor('#00c6ff'), // Bright Aqua Blue
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 55.r,
                                    width: 55.r,
                                    padding: EdgeInsets.all(5.r),
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#FF9F1C'), // Golden Amber
                                    ),
                                    child: Image.asset("assets/images/cost_good_calculator.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Cost Of Good\nSold Calculator',
                                          style: GoogleFonts.lato(
                                            fontSize: 12.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '>>>',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.r,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, business_forecast_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                              height: 80.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('#11998E'), // Teal
                                    HexColor('#38EF7D'), // Dark Cyan
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 55.r,
                                    width: 55.r,
                                    padding: EdgeInsets.all(5.r),
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#F4A261'), // Warm Orange
                                    ),
                                    child: Image.asset("assets/images/business_forecast_calculator.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Business Fore-\ncast Calculator',
                                          style: GoogleFonts.lato(
                                            fontSize: 12.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '>>>',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.r,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, discount_calculator_screen.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                              height: 80.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('#FF4E50'), // Sunset Orange
                                    HexColor('#F9D423'), // Deep Gold
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 55.r,
                                    width: 55.r,
                                    padding: EdgeInsets.all(5.r),
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor('#4A69BB'),
                                    ),
                                    child: Image.asset("assets/images/discount_calculator.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Discount\nCalculator',
                                          style: GoogleFonts.lato(
                                            fontSize: 12.r,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '>>>',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.r,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Other Calculator',
                      style: GoogleFonts.lato(
                        fontSize: 20.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, age_calculator_screen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 60.r,
                                width: 60.r,
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor('#9C27B0'),
                                ),
                                child: Image.asset("assets/images/age_calculator.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Age\nCalculator',
                                  style: GoogleFonts.lato(
                                    fontSize: 10.r,
                                    color: HexColor('#9C27B0'),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, length_calculator_screen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 60.r,
                                width: 60.r,
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor('#00BCD4'),
                                ),
                                child: Image.asset("assets/images/length_calculator.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Length\nCalculator',
                                  style: GoogleFonts.lato(
                                    fontSize: 10.r,
                                    color: HexColor('#00BCD4'),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, weight_calculator_screen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 60.r,
                                width: 60.r,
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor('#FF5722'),
                                ),
                                child: Image.asset("assets/images/weight_calculator.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Weight\nCalculator',
                                  style: GoogleFonts.lato(
                                    fontSize: 10.r,
                                    color: HexColor('#FF5722'),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, temperature_calculator_screen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 60.r,
                                width: 60.r,
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor('#8BC34A'),
                                ),
                                child: Image.asset("assets/images/temperature_calculator.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Temperature\nCalculator',
                                  style: GoogleFonts.lato(
                                    fontSize: 10.r,
                                    color: HexColor('#8BC34A'),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
