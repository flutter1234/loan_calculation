// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:loan_calculation/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:loan_calculation/AdPlugin/Ads/Native/NativeRN.dart';

class gross_profit_calculator_screen extends StatefulWidget {
  static const routeName = '/gross_profit_calculator_screen';

  const gross_profit_calculator_screen({super.key});

  @override
  State<gross_profit_calculator_screen> createState() => _gross_profit_calculator_screenState();
}

class _gross_profit_calculator_screenState extends State<gross_profit_calculator_screen> {
  final TextEditingController _costPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();

  double? _margin;
  double? _markup;

  void _calculate() {
    FocusScope.of(context).unfocus();
    double costPrice = double.tryParse(_costPriceController.text) ?? 0.0;
    double sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;

    if (costPrice > 0 && sellingPrice > 0) {
      double margin = ((sellingPrice - costPrice) / sellingPrice) * 100;
      double markup = ((sellingPrice - costPrice) / costPrice) * 100;

      setState(() {
        _margin = margin;
        _markup = markup;
      });
    } else {
      setState(() {
        _margin = null;
        _markup = null;
      });
    }
  }

  void resetFields() {
    setState(() {
      _costPriceController.clear();
      _sellingPriceController.clear();
      _margin = null;
      _markup = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gross Profit Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _costPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Cost Price',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter the Cost Price",
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
                  controller: _sellingPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Selling Price',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter the Selling Price",
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
                _margin != null
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
                            Text(
                              "Margin",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                            SizedBox(height: 5.r),
                            Text(
                              "${_margin!.toStringAsFixed(2)}%",
                              style: GoogleFonts.lato(
                                fontSize: 14.r,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                NativeRN(parentContext: context),
                _markup != null
                    ? Container(
                        width: 1.sw,
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: HexColor('008080').withOpacity(0.1),
                          border: Border.all(color: HexColor('008080'), width: 1.w),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Markup",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                            SizedBox(height: 5.r),
                            Text(
                              "${_markup!.toStringAsFixed(2)}%",
                              style: GoogleFonts.lato(
                                fontSize: 14.r,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
