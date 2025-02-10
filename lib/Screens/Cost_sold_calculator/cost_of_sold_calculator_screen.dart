// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class cost_of_sold_calculator_screen extends StatefulWidget {
  static const routeName = '/cost_of_sold_calculator_screen';

  const cost_of_sold_calculator_screen({super.key});

  @override
  State<cost_of_sold_calculator_screen> createState() => _cost_of_sold_calculator_screenState();
}

class _cost_of_sold_calculator_screenState extends State<cost_of_sold_calculator_screen> {
  final TextEditingController _beginningInventoryController = TextEditingController();
  final TextEditingController _purchasesController = TextEditingController();
  final TextEditingController _endingInventoryController = TextEditingController();

  double? _cogs;

  void _calculateCOGS() {
    FocusScope.of(context).unfocus();
    double beginningInventory = double.tryParse(_beginningInventoryController.text) ?? 0.0;
    double purchases = double.tryParse(_purchasesController.text) ?? 0.0;
    double endingInventory = double.tryParse(_endingInventoryController.text) ?? 0.0;

    if (beginningInventory >= 0 && purchases >= 0 && endingInventory >= 0) {
      double cogs = (beginningInventory + purchases) - endingInventory;
      setState(() {
        _cogs = cogs;
      });
    } else {
      setState(() {
        _cogs = null;
      });
    }
  }

  void resetFields() {
    setState(() {
      _beginningInventoryController.clear();
      _purchasesController.clear();
      _endingInventoryController.clear();
      _cogs = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cost of Goods Sold Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _beginningInventoryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  'Beginning Inventory',
                  style: GoogleFonts.lato(
                    fontSize: 16.r,
                    color: HexColor('008080'),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Enter the Beginning Inventory",
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
              controller: _purchasesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  'Purchase',
                  style: GoogleFonts.lato(
                    fontSize: 16.r,
                    color: HexColor('008080'),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Enter the Purchase",
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
              controller: _endingInventoryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  'Ending Inventory',
                  style: GoogleFonts.lato(
                    fontSize: 16.r,
                    color: HexColor('008080'),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Enter the Ending Inventory",
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
                    onTap: _calculateCOGS,
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
            _cogs != null
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
                          "Cost of Good Sold",
                          style: GoogleFonts.lato(
                            fontSize: 16.r,
                            fontWeight: FontWeight.bold,
                            color: HexColor('008080'),
                          ),
                        ),
                        SizedBox(height: 5.r),
                        Text(
                          "${_cogs!.toStringAsFixed(2)}",
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
    );
  }
}
