import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class loan_compare_screen extends StatefulWidget {
  static const routeName = '/loan_compare_screen';

  const loan_compare_screen({super.key});

  @override
  State<loan_compare_screen> createState() => _loan_compare_screenState();
}

class _loan_compare_screenState extends State<loan_compare_screen> {
  final TextEditingController loan1AmountController = TextEditingController();
  final TextEditingController loan1InterestController = TextEditingController();
  final TextEditingController loan1TenureController = TextEditingController();

  final TextEditingController loan2AmountController = TextEditingController();
  final TextEditingController loan2InterestController = TextEditingController();
  final TextEditingController loan2TenureController = TextEditingController();

  double loan1EMI = 0;
  double loan2EMI = 0;
  double loan1TotalInterest = 0;
  double loan2TotalInterest = 0;
  double loan1TotalPayment = 0;
  double loan2TotalPayment = 0;

  @override
  void dispose() {
    loan1AmountController.dispose();
    loan1InterestController.dispose();
    loan1TenureController.dispose();
    loan2AmountController.dispose();
    loan2InterestController.dispose();
    loan2TenureController.dispose();
    super.dispose();
  }

  void resetFields() {
    setState(() {
      loan1AmountController.clear();
      loan1InterestController.clear();
      loan1TenureController.clear();
      loan2AmountController.clear();
      loan2InterestController.clear();
      loan2TenureController.clear();
      loan1EMI = 0;
      loan2EMI = 0;
      loan1TotalInterest = 0;
      loan2TotalInterest = 0;
      loan1TotalPayment = 0;
      loan2TotalPayment = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Loans'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Loan 1",
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            fontWeight: FontWeight.w900,
                            color: HexColor('008080'),
                          ),
                        ),
                        SizedBox(height: 20.r),
                        TextField(
                          controller: loan1AmountController,
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
                            hintText: "For Loan 1",
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
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Loan 2",
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            fontWeight: FontWeight.w900,
                            color: HexColor('008080'),
                          ),
                        ),
                        SizedBox(height: 20.r),
                        TextField(
                          controller: loan2AmountController,
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
                            hintText: "For Loan 2",
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
                              borderSide: BorderSide(color: Colors.black54, width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.r),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: loan1InterestController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Interest (%)',
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            color: HexColor('008080'),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "For Loan 1",
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
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: TextField(
                      controller: loan2InterestController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Interest (%)',
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            color: HexColor('008080'),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "For Loan 2",
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
                  ),
                ],
              ),
              SizedBox(height: 20.r),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: loan1TenureController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Loan Tenure',
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            color: HexColor('008080'),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "For Loan 1",
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
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: TextField(
                      controller: loan2TenureController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Loan Tenure',
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            color: HexColor('008080'),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "For Loan 1",
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
                      onTap: calculateComparison,
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
              if (loan1EMI > 0 && loan2EMI > 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: HexColor('008080').withOpacity(0.1),
                        border: Border.all(color: HexColor('008080'), width: 1.w),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Compare EMI of both loans",
                            style: GoogleFonts.lato(
                              fontSize: 14.r,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 10.r),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${loan1EMI.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${loan2EMI.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            height: 0.5.h,
                            color: HexColor('008080'),
                          ),
                          Text(
                            "Difference : ${(loan1EMI - loan2EMI).abs().toStringAsFixed(2)}",
                            style: GoogleFonts.lato(
                              fontSize: 18.r,
                              fontWeight: FontWeight.w900,
                              color: HexColor('008080'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: HexColor('008080').withOpacity(0.1),
                        border: Border.all(color: HexColor('008080'), width: 1.w),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Compare with Total Interest Value",
                            style: GoogleFonts.lato(
                              fontSize: 14.r,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 10.r),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${loan1TotalInterest.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${loan2TotalInterest.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            height: 0.5.h,
                            color: HexColor('008080'),
                          ),
                          Text(
                            "Difference : ${(loan1TotalInterest - loan2TotalInterest).abs().toStringAsFixed(2)}",
                            style: GoogleFonts.lato(
                              fontSize: 18.r,
                              fontWeight: FontWeight.w900,
                              color: HexColor('008080'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: HexColor('008080').withOpacity(0.1),
                        border: Border.all(color: HexColor('008080'), width: 1.w),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Compare with Total Payment Amount",
                            style: GoogleFonts.lato(
                              fontSize: 14.r,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 10.r),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${loan1TotalPayment.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${loan2TotalPayment.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            height: 0.5.h,
                            color: HexColor('008080'),
                          ),
                          Text(
                            "Difference : ${(loan1TotalPayment - loan2TotalPayment).abs().toStringAsFixed(2)}",
                            style: GoogleFonts.lato(
                              fontSize: 18.r,
                              fontWeight: FontWeight.w900,
                              color: HexColor('008080'),
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

  void calculateComparison() {
    FocusScope.of(context).unfocus();
    double loan1Amount = double.tryParse(loan1AmountController.text) ?? 0;
    double loan1Interest = double.tryParse(loan1InterestController.text) ?? 0;
    int loan1Tenure = int.tryParse(loan1TenureController.text) ?? 0;

    double loan2Amount = double.tryParse(loan2AmountController.text) ?? 0;
    double loan2Interest = double.tryParse(loan2InterestController.text) ?? 0;
    int loan2Tenure = int.tryParse(loan2TenureController.text) ?? 0;

    setState(() {
      loan1EMI = calculateEMI(loan1Amount, loan1Interest, loan1Tenure);
      loan1TotalPayment = loan1EMI * loan1Tenure;
      loan1TotalInterest = loan1TotalPayment - loan1Amount;

      loan2EMI = calculateEMI(loan2Amount, loan2Interest, loan2Tenure);
      loan2TotalPayment = loan2EMI * loan2Tenure;
      loan2TotalInterest = loan2TotalPayment - loan2Amount;
    });
  }

  double calculateEMI(double amount, double annualRate, int tenureMonths) {
    double monthlyRate = annualRate / (12 * 100);
    return (amount * monthlyRate * pow(1 + monthlyRate, tenureMonths)) / (pow(1 + monthlyRate, tenureMonths) - 1);
  }
}
