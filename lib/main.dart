import 'package:car_dekh_lo/Controller/map_controller.dart';
import 'package:car_dekh_lo/View/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Controller/car_controller.dart';
import 'config/app_colors.dart';
import 'config/firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(CarController());
    Get.lazyPut(() => MapController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.leftToRightWithFade,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.lightBackColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
              background: AppColors.lightBackColor,
            ),
            fontFamily: 'Raleway',
            brightness: Brightness.light,
            scrollbarTheme: ScrollbarThemeData(
              interactive: true,
              thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
              radius: const Radius.circular(60),
            ),
            iconTheme: const IconThemeData(color: AppColors.primaryColor),
            textTheme: TextTheme(
              // button: TextStyle(color: AppColors.kLightBackColor),
              titleLarge:
                  TextStyle(color: AppColors.textColor, fontSize: 18.sp),
              headlineSmall:
                  TextStyle(color: AppColors.lightBackColor, fontSize: 20.sp),
              headlineMedium:
                  TextStyle(color: AppColors.lightBackColor, fontSize: 22.sp),
              displaySmall:
                  TextStyle(color: AppColors.lightBackColor, fontSize: 24.sp),
              displayMedium:
                  TextStyle(color: AppColors.lightBackColor, fontSize: 26.sp),
              displayLarge:
                  TextStyle(color: AppColors.lightBackColor, fontSize: 28.sp),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightBackColor,
                elevation: 1,
                textStyle: Get.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      fontSize: Get.textTheme.bodyMedium?.fontSize,
                      color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  foregroundColor: AppColors.primaryColor),
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor,
              foregroundColor: AppColors.lightBackColor,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              iconTheme: IconThemeData(
                color: AppColors.lightBackColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
            ),
          ),
          home: child,
        );
      },
      child: HomePage(),
    );
  }
}
