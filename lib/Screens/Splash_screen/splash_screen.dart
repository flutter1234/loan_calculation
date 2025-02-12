import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class splash_screen extends StatefulWidget {
  static const routeName = '/splash_screen';

  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('008080'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 4),
            Image(
              image: AssetImage('assets/images/emi_calculator.png'),
              height: 220.r,
            ),
            Spacer(flex: 1),
            Column(
              children: [
                Text(
                  'EMI CALCULATOR',
                  style: GoogleFonts.lato(
                    fontSize: 22.r,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  textAlign: TextAlign.center,
                  'This Loan EMI Calculator IS Useful as Car Loan Calculator ,Home Loan Calculator ,Bank FD & RD Or Other',
                  style: GoogleFonts.lato(
                    fontSize: 12.r,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 50.r,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
