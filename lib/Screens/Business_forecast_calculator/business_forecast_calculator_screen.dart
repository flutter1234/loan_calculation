// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class business_forecast_calculator_screen extends StatefulWidget {
  static const routeName = '/business_forecast_calculator_screen';

  const business_forecast_calculator_screen({super.key});

  @override
  State<business_forecast_calculator_screen> createState() => _business_forecast_calculator_screenState();
}

class _business_forecast_calculator_screenState extends State<business_forecast_calculator_screen> {
  final _revenueController = TextEditingController();
  final _growthController = TextEditingController();
  final _yearsController = TextEditingController();
  final _costPercentageController = TextEditingController();
  final _costIncreaseController = TextEditingController();

  List<Map<String, dynamic>> _forecastResults = [];

  void _calculateForecast() {
    FocusScope.of(context).unfocus();
    double revenue = double.tryParse(_revenueController.text) ?? 0.0;
    double growthRate = (double.tryParse(_growthController.text) ?? 0.0) / 100;
    int years = int.tryParse(_yearsController.text) ?? 0;
    double costPercentage = (double.tryParse(_costPercentageController.text) ?? 0.0) / 100;
    double costIncreaseRate = (double.tryParse(_costIncreaseController.text) ?? 0.0) / 100;

    List<Map<String, dynamic>> results = [];
    for (int i = 1; i <= years; i++) {
      double cost = revenue * costPercentage;
      results.add({
        'year': i,
        'revenue': revenue.toStringAsFixed(2),
        'cost': cost.toStringAsFixed(2),
      });

      revenue += revenue * growthRate;
      costPercentage += costPercentage * costIncreaseRate;
    }
    setState(() {
      _forecastResults = results;
    });
  }

  @override
  void dispose() {
    _revenueController.dispose();
    _growthController.dispose();
    _yearsController.dispose();
    _costPercentageController.dispose();
    _costIncreaseController.dispose();
    super.dispose();
  }

  void resetFields() {
    setState(() {
      _revenueController.clear();
      _growthController.clear();
      _yearsController.clear();
      _costPercentageController.clear();
      _costIncreaseController.clear();
      _forecastResults = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Forecast Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              TextField(
                controller: _revenueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Revenue',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Revenue",
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
                controller: _growthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Revenue Growth ( % )',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Revenue Growth ( % )",
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
                controller: _yearsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Number of Years',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Number of Years",
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
                controller: _costPercentageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Cost of Revenue ( % )',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Cost of Revenue ( % )",
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
                controller: _costIncreaseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Cost Percentage Increase Per Year ( % )',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Cost Percentage Increase Per Year ( % )",
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
              SizedBox(height: 30.r),
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
                      onTap: _calculateForecast,
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
              _forecastResults.isNotEmpty
                  ? Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: HexColor('008080').withOpacity(0.1),
                        border: Border.all(color: HexColor('008080'), width: 1.w),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _forecastResults.length,
                        itemBuilder: (context, index) {
                          final result = _forecastResults[index];
                          return Container(
                            padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: HexColor('008080'),
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Years ${result['year']}",
                                  style: GoogleFonts.lato(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('008080'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Revenue",
                                            style: GoogleFonts.lato(
                                              fontSize: 16.r,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('008080'),
                                            ),
                                          ),
                                          SizedBox(height: 5.r),
                                          Text(
                                            "${result['revenue']}",
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
                                            "Cost",
                                            style: GoogleFonts.lato(
                                              fontSize: 16.r,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('008080'),
                                            ),
                                          ),
                                          SizedBox(height: 5.r),
                                          Text(
                                            "${result['cost']}",
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
                          );
                        },
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
