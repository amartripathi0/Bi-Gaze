import 'package:flutter/material.dart';
// part 'app_icons.dart';
// part 'color/light_color.dart';
// part 'text_styles.dart';
// part 'extention.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 58, 56, 47),
    cardColor: const Color.fromARGB(255, 255, 134, 134),
    unselectedWidgetColor: Colors.grey,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: SoothingColors.purpleGray,
    ),
    appBarTheme: const AppBarTheme(
      color: SoothingColors.purpleGray,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      // ignore: deprecated_member_use
    ),
    bottomAppBarTheme: ThemeData.light().bottomAppBarTheme.copyWith(
          shadowColor: SoothingColors.purpleGray.withAlpha(200),
          elevation: 10,
        ),
    bottomNavigationBarTheme:
        ThemeData.light().bottomNavigationBarTheme.copyWith(
              backgroundColor: Colors.black,
              elevation: 10,
            ),

    // colorScheme: const ColorScheme(
    //   background: Colors.white,
    //   onPrimary: Colors.white,
    //   onBackground: Colors.black,
    //   onError: Colors.white,
    //   onSecondary: Colors.white,
    //   onSurface: Colors.black,
    //   error: Colors.red,
    //   primary: Colors.blue,
    //   primaryContainer: Colors.blue,
    //   secondary: AppColor.secondary,
    //   secondaryContainer: AppColor.darkGrey,
    //   surface: Colors.white,
    //   brightness: Brightness.light,
    // ),
  );

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
        blurRadius: 10,
        offset: const Offset(5, 5),
        color: AppTheme.appTheme.colorScheme.secondary,
        spreadRadius: 1)
  ];
  static BoxDecoration softDecoration =
      const BoxDecoration(boxShadow: <BoxShadow>[
    BoxShadow(
        blurRadius: 8,
        offset: Offset(5, 5),
        color: Color.fromARGB(255, 71, 120, 255),
        spreadRadius: 5),
    BoxShadow(
        blurRadius: 8,
        offset: Offset(-5, -5),
        color: Color.fromARGB(255, 255, 65, 65),
        spreadRadius: 5)
  ], color: Color.fromARGB(255, 77, 148, 255));
}

String get description {
  return '';
}

class SoothingColors {
  static const Color purpleGray = Color.fromARGB(255, 142, 122, 181);
  static const Color lavenderPink = Color.fromARGB(255, 183, 132, 183);
  static const Color roseDust = Color.fromARGB(255, 228, 147, 179);
  static const Color blushPink = Color.fromARGB(255, 238, 165, 166);
}
