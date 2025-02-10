import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/Screens/Future_value_screen/future_value_screen.dart';

class setting_screen extends StatefulWidget {
  static const routeName = '/setting_screen';

  const setting_screen({super.key});

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, future_value_screen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  margin: EdgeInsets.only(top: 10.h),
                  height: 65.r,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: HexColor('008080'),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45.r,
                        width: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.privacy_tip_outlined,
                          color: HexColor('008080'),
                          size: 25.r,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.lato(
                          fontSize: 18.r,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, future_value_screen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  margin: EdgeInsets.only(top: 10.h),
                  height: 65.r,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: HexColor('008080'),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45.r,
                        width: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.contact_support_outlined,
                          color: HexColor('008080'),
                          size: 25.r,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Contact Us',
                        style: GoogleFonts.lato(
                          fontSize: 18.r,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, future_value_screen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  margin: EdgeInsets.only(top: 10.h),
                  height: 65.r,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: HexColor('008080'),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45.r,
                        width: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.star_rate_outlined,
                          color: HexColor('008080'),
                          size: 25.r,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Rate Us',
                        style: GoogleFonts.lato(
                          fontSize: 18.r,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, future_value_screen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  margin: EdgeInsets.only(top: 10.h),
                  height: 65.r,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: HexColor('008080'),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45.r,
                        width: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.share_outlined,
                          color: HexColor('008080'),
                          size: 25.r,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Share App',
                        style: GoogleFonts.lato(
                          fontSize: 18.r,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  exit(0);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  margin: EdgeInsets.only(top: 10.h),
                  height: 65.r,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: HexColor('008080'),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45.r,
                        width: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.exit_to_app,
                          color: HexColor('008080'),
                          size: 25.r,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Exit App',
                        style: GoogleFonts.lato(
                          fontSize: 18.r,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
