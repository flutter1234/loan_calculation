import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:loan_calculation/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:loan_calculation/AdPlugin/Ads/Native/NativeRN.dart';

class gst_calculator_screen extends StatefulWidget {
  static const routeName = '/gst_calculator_screen';

  const gst_calculator_screen({super.key});

  @override
  State<gst_calculator_screen> createState() => _gst_calculator_screenState();
}

class _gst_calculator_screenState extends State<gst_calculator_screen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController gstRateController = TextEditingController();

  bool isAddGST = true;
  double totalAmount = 0.0;
  double gstAmount = 0.0;
  double cGst = 0.0;
  double sGst = 0.0;

  void calculateGST() {
    FocusScope.of(context).unfocus();
    double initialAmount = double.tryParse(amountController.text) ?? 0.0;
    double gstRate = double.tryParse(gstRateController.text) ?? 0.0;

    setState(() {
      if (isAddGST) {
        gstAmount = (initialAmount * gstRate) / 100;
        cGst = gstAmount / 2;
        sGst = gstAmount / 2;
        totalAmount = initialAmount + gstAmount;
      } else {
        // When removing GST, subtract the GST from the total amount
        gstAmount = (initialAmount * gstRate) / 100;
        totalAmount = initialAmount - gstAmount; // Subtract GST from the total
      }
    });
  }

  void resetFields() {
    setState(() {
      amountController.clear();
      gstRateController.clear();
      totalAmount = 0.0;
      cGst = 0.0;
      sGst = 0.0;
      gstAmount = 0.0;
      isAddGST = true;
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    gstRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('GST Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Amount (₹)',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter the Amount (₹)",
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
                  controller: gstRateController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Rate Of GST (%)',
                      style: GoogleFonts.lato(
                        fontSize: 16.r,
                        color: HexColor('008080'),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter the Rate Of GST (%)",
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAddGST = true;
                            });
                          },
                          child: Container(
                            height: 25.r,
                            width: 25.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: HexColor('008080'), width: 2.w),
                            ),
                            child: isAddGST
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: HexColor('008080'),
                                          shape: BoxShape.circle,
                                        ),
                                        height: 15.r,
                                        width: 15.r,
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text('Add GST'),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAddGST = false;
                            });
                          },
                          child: Container(
                            height: 25.r,
                            width: 25.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: HexColor('008080'), width: 2.w),
                            ),
                            child: !isAddGST
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: HexColor('008080'),
                                          shape: BoxShape.circle,
                                        ),
                                        height: 15.r,
                                        width: 15.r,
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text('Remove GST'),
                      ],
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
                        onTap: () {
                          AdsRN().showFullScreen(
                            context: context,
                            onComplete: () {
                              calculateGST();
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
                if (totalAmount > 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                "Initial Amount",
                                style: GoogleFonts.lato(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('008080'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "₹ ${amountController.text}",
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
                                "GST Amount",
                                style: GoogleFonts.lato(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('008080'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "₹ ${gstAmount.toStringAsFixed(2)}",
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
                                "₹ ${totalAmount.toStringAsFixed(2)}",
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
}
