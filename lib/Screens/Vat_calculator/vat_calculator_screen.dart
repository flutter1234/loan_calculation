import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class vat_calculator_screen extends StatefulWidget {
  static const routeName = '/vat_calculator_screen';

  const vat_calculator_screen({super.key});

  @override
  State<vat_calculator_screen> createState() => _vat_calculator_screenState();
}

class _vat_calculator_screenState extends State<vat_calculator_screen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController vatRateController = TextEditingController();

  bool isAddVAT = true;
  double totalAmount = 0.0;
  double vatAmount = 0.0;
  double baseAmount = 0.0;

  void resetFields() {
    setState(() {
      amountController.clear();
      vatRateController.clear();
      totalAmount = 0.0;
      vatAmount = 0.0;
      baseAmount = 0.0;
      isAddVAT = true;
    });
  }

  void calculateVAT() {
    FocusScope.of(context).unfocus();
    double initialAmount = double.tryParse(amountController.text) ?? 0.0;
    double vatRate = double.tryParse(vatRateController.text) ?? 0.0;

    setState(() {
      if (isAddVAT) {
        vatAmount = (initialAmount * vatRate) / 100;
        totalAmount = initialAmount + vatAmount;
        baseAmount = initialAmount; // Original amount remains the same
      } else {
        totalAmount = initialAmount; // Net price remains the amount entered
        baseAmount = totalAmount / (1 + vatRate / 100); // Reverse to get the base amount
        vatAmount = totalAmount - baseAmount; // VAT is the difference
      }
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    vatRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VAT Calculator'),
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
                controller: vatRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Rate Of VAT (%)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Rate Of VAT (%)",
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
                            isAddVAT = true;
                          });
                        },
                        child: Container(
                          height: 25.r,
                          width: 25.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: HexColor('008080'), width: 2.w),
                          ),
                          child: isAddVAT
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
                      Text('Add VAT'),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isAddVAT = false;
                          });
                        },
                        child: Container(
                          height: 25.r,
                          width: 25.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: HexColor('008080'), width: 2.w),
                          ),
                          child: !isAddVAT
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
                      Text('Remove VAT'),
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
                      onTap: calculateVAT,
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
                              "Original Cost",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              isAddVAT ? "₹ ${baseAmount.toStringAsFixed(2)}" : "₹ ${totalAmount.toStringAsFixed(2)}",
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
                              "VAT Price",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "₹ ${vatAmount.toStringAsFixed(2)}",
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
                              "Net Price",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              !isAddVAT ? "₹ ${baseAmount.toStringAsFixed(2)}" : "₹ ${totalAmount.toStringAsFixed(2)}",
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
    );
  }
}
