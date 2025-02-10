import 'package:flutter/material.dart';
import 'package:loan_calculation/Screens/Age_calculator/age_calculator_screen.dart';
import 'package:loan_calculation/Screens/Business_forecast_calculator/business_forecast_calculator_screen.dart';
import 'package:loan_calculation/Screens/Cost_sold_calculator/cost_of_sold_calculator_screen.dart';
import 'package:loan_calculation/Screens/Discount_calculator/discount_calculator_screen.dart';
import 'package:loan_calculation/Screens/Emi_calculator/emi_calculator.dart';
import 'package:loan_calculation/Screens/Fd_calculator/fd_calculator.dart';
import 'package:loan_calculation/Screens/Future_value_screen/future_value_screen.dart';
import 'package:loan_calculation/Screens/Gross_profit_calculator/gross_profit_calculator_screen.dart';
import 'package:loan_calculation/Screens/Gst_calculator/gst_calculator_screen.dart';
import 'package:loan_calculation/Screens/Home_screen/home_screen.dart';
import 'package:loan_calculation/Screens/Length_calculator/length_calculator_screen.dart';
import 'package:loan_calculation/Screens/Loan_compare/loan_compare_screen.dart';
import 'package:loan_calculation/Screens/MIS_calculator/mis_calculator_screen.dart';
import 'package:loan_calculation/Screens/Nsc_calculator/nsc_calculator_screen.dart';
import 'package:loan_calculation/Screens/Rd_calculator/rd_calculator.dart';
import 'package:loan_calculation/Screens/Setting_screen/setting_screen.dart';
import 'package:loan_calculation/Screens/Sip_calculator/sip_calculator.dart';
import 'package:loan_calculation/Screens/Splash_screen/splash_screen.dart';
import 'package:loan_calculation/Screens/Temperature_calculator/temperature_calculator_screen.dart';
import 'package:loan_calculation/Screens/Vat_calculator/vat_calculator_screen.dart';
import 'package:loan_calculation/Screens/Weight_calculator/weight_calculator_screen.dart';

class Router {
  static MaterialPageRoute onRouteGenrator(settings) {
    switch (settings.name) {
      case splash_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const splash_screen(),
        );
      case home_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const home_screen(),
        );
      case emi_calculator.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const emi_calculator(),
        );
      case sip_calculator.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const sip_calculator(),
        );
      case fd_calculator.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const fd_calculator(),
        );
      case rd_calculator.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const rd_calculator(),
        );
      case loan_compare_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const loan_compare_screen(),
        );
      case gst_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const gst_calculator_screen(),
        );
      case vat_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const vat_calculator_screen(),
        );
      case mis_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const mis_calculator_screen(),
        );
      case nsc_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const nsc_calculator_screen(),
        );
      case gross_profit_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const gross_profit_calculator_screen(),
        );
      case cost_of_sold_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const cost_of_sold_calculator_screen(),
        );
      case discount_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const discount_calculator_screen(),
        );
      case business_forecast_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const business_forecast_calculator_screen(),
        );
      case age_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const age_calculator_screen(),
        );
      case length_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const length_calculator_screen(),
        );
      case weight_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const weight_calculator_screen(),
        );
      case temperature_calculator_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const temperature_calculator_screen(),
        );
      case future_value_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const future_value_screen(),
        );
      case setting_screen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const setting_screen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Material(
            child: Center(
              child: Text("404 page not founded"),
            ),
          ),
        );
    }
  }
}
