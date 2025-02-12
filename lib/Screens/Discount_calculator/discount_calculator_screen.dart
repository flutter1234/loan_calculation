// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:loan_calculation/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:loan_calculation/AdPlugin/Ads/Native/NativeRN.dart';

class discount_calculator_screen extends StatefulWidget {
  static const routeName = '/discount_calculator_screen';

  const discount_calculator_screen({super.key});

  @override
  State<discount_calculator_screen> createState() => _discount_calculator_screenState();
}

class _discount_calculator_screenState extends State<discount_calculator_screen> {
  final TextEditingController _originalPriceController = TextEditingController();
  final TextEditingController _discountPercentageController = TextEditingController();

  double? _discountAmount;
  double? _finalPrice;

  void _calculateDiscount() {
    FocusScope.of(context).unfocus();
    double originalPrice = double.tryParse(_originalPriceController.text) ?? 0.0;
    double discountPercentage = double.tryParse(_discountPercentageController.text) ?? 0.0;

    if (originalPrice > 0 && discountPercentage >= 0 && discountPercentage <= 100) {
      double discountAmount = (originalPrice * discountPercentage) / 100;
      double finalPrice = originalPrice - discountAmount;

      setState(() {
        _discountAmount = discountAmount;
        _finalPrice = finalPrice;
      });
    } else {
      setState(() {
        _discountAmount = null;
        _finalPrice = null;
      });
    }
  }

  void resetFields() {
    setState(() {
      _originalPriceController.clear();
      _discountPercentageController.clear();
      _discountAmount = null;
      _finalPrice = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Discount Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _originalPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Original Price',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter Original Price",
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
                  controller: _discountPercentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Discount Percentage ( % )',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter Discount Percentage ( % )",
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
                              _calculateDiscount();
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
                _discountAmount != null && _finalPrice != null
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
                                        "Discounted Price",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${_finalPrice!.toStringAsFixed(2)}",
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
                                        "Amount Saved",
                                        style: GoogleFonts.lato(
                                          fontSize: 16.r,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('008080'),
                                        ),
                                      ),
                                      SizedBox(height: 5.r),
                                      Text(
                                        "${_discountAmount!.toStringAsFixed(2)}",
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
                NativeRN(parentContext: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
