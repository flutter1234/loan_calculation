import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_calculation/AdPlugin/AdLoader/AdLoader.dart';
import 'package:loan_calculation/AdPlugin/Provider/AdpluginProvider.dart';
import 'package:loan_calculation/AdPlugin/Screen/SplashScreen.dart';
import 'package:loan_calculation/AdPlugin/Utils/Extensions.dart';
import 'package:loan_calculation/AdPlugin/Utils/NavigationService.dart';
import 'package:loan_calculation/Routes/Routes.dart' as r;
import 'package:loan_calculation/Screens/Home_screen/home_screen.dart';
import 'package:loan_calculation/Screens/Splash_screen/splash_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(loan_calculation());
}

GetStorage storage = GetStorage();
bool isIpad = false;
bool isSmall = false;

class loan_calculation extends StatefulWidget {
  const loan_calculation({super.key});

  @override
  State<loan_calculation> createState() => _loan_calculationState();
}

class _loan_calculationState extends State<loan_calculation> {
  @override
  Widget build(BuildContext context) {
    DartPingIOS.register();
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      isIpad = true;
    } else if (screenWidth < 420) {
      isSmall = true;
    }
    return AdpluginProvider(
      child: AdLoader(
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              home: AdSplashScreen(
                  onComplete: (context, mainJson) async {
                    "/splash_screen".performAction(
                      context: context,
                      onComplete: () {
                        Navigator.pushReplacementNamed(context, home_screen.routeName);
                      },
                    );
                  },
                  servers: const [
                    "github.io",
                    // "coinspinmaster.com",
                    // "trailerspot4k.com",
                  ],
                  jsonUrl: const [
                    "https://flutter1234.github.io/loan_calculation/main.json",
                    "https://coinspinmaster.com/raj/ios/anime/json/main.json",
                    "https://trailerspot4k.com/raj/ios/anime/json/main.json"
                  ],
                  version: '1.0.0',
                  child: const splash_screen()),
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  backgroundColor: HexColor('FEFCFF'),
                  titleTextStyle: GoogleFonts.lato(
                    fontSize: 18.r,
                    color: HexColor('008080'),
                    fontWeight: FontWeight.w900,
                  ),
                  iconTheme: IconThemeData(size: 22.h, color: HexColor('008080')),
                ),
                scaffoldBackgroundColor: HexColor('FEFCFF'),
              ),
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: r.Router.onRouteGenrator,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }

// Widget build(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;
//   if (screenWidth > 600) {
//     isIpad = true;
//   } else if (screenWidth < 420) {
//     isSmall = true;
//   }
//   return ScreenUtilInit(
//     designSize: const Size(360, 690),
//     minTextAdapt: true,
//     splitScreenMode: true,
//     builder: (context, child) {
//       return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (context) => ApiData()),
//         ],
//         child: MaterialApp(
//           home: splash_screen(),
//           theme: ThemeData(
//             appBarTheme: AppBarTheme(
//               centerTitle: true,
//               backgroundColor: HexColor('FEFCFF'),
//               titleTextStyle: GoogleFonts.lato(
//                 fontSize: 18.r,
//                 color: HexColor('008080'),
//                 fontWeight: FontWeight.w900,
//               ),
//               iconTheme: IconThemeData(size: 22.h, color: HexColor('008080')),
//             ),
//             scaffoldBackgroundColor: HexColor('FEFCFF'),
//           ),
//           onGenerateRoute: r.Router.onRouteGenrator,
//           debugShowCheckedModeBanner: false,
//         ),
//       );
//     },
//   );
// }
}
