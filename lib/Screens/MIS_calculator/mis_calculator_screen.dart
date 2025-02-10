import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class mis_calculator_screen extends StatefulWidget {
  static const routeName = '/mis_calculator_screen';

  const mis_calculator_screen({super.key});

  @override
  State<mis_calculator_screen> createState() => _mis_calculator_screenState();
}

class _mis_calculator_screenState extends State<mis_calculator_screen> {
  final TextEditingController depositController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  int touchedIndex = -1;
  double monthlyIncome = 0.0;
  double totalInterest = 0.0;
  double maturityAmount = 0.0;

  void calculateMIS() {
    FocusScope.of(context).unfocus();
    double depositAmount = double.tryParse(depositController.text) ?? 0.0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0.0;
    const int termYears = 5;

    setState(() {
      totalInterest = (depositAmount * interestRate * termYears) / 100;
      maturityAmount = depositAmount + totalInterest;
      monthlyIncome = totalInterest / (termYears * 12);
    });
  }

  @override
  void dispose() {
    depositController.dispose();
    interestRateController.dispose();
    super.dispose();
  }

  void resetFields() {
    setState(() {
      depositController.clear();
      interestRateController.clear();
      monthlyIncome = 0.0;
      maturityAmount = 0.0;
      totalInterest = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Income Scheme (MIS)'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: depositController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Deposit Amount (₹)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Deposit Amount (₹)",
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
                controller: interestRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Interest Rate (%)',
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      color: HexColor('008080'),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter the Interest Rate (%)",
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
              SizedBox(height: 10.r),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Term",
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      fontWeight: FontWeight.bold,
                      color: HexColor('008080'),
                    ),
                  ),
                  Text(
                    "5 Years",
                    style: GoogleFonts.lato(
                      fontSize: 16.r,
                      fontWeight: FontWeight.bold,
                      color: HexColor('008080'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.r),
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
                      onTap: calculateMIS,
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
              if (maturityAmount > 0)
                Column(
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
                              "Monthly Interest",
                              style: GoogleFonts.lato(
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold,
                                color: HexColor('008080'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "₹ ${monthlyIncome.toStringAsFixed(2)}",
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
                ),
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
        value: depositController.text.isNotEmpty ? double.parse(depositController.text) : 0.0,
        title: '${((double.parse(depositController.text) / maturityAmount) * 100).toStringAsFixed(1)}%',
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
