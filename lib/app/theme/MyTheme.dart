import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class Mytheme {
//   static final light = ThemeData.light().copyWith();
//   static final dark = ThemeData.dark().copyWith();
// }

ThemeData lightTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff0004FF),
    brightness: Brightness.light,
  ),
  primaryColor: const Color(0xff0004FF),
  primaryColorDark: const Color(0xff0004FF),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: const Color(0xff0004FF),
      foregroundColor: Colors.white,
    ),
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffFFFFFF),
  canvasColor: const Color(0xffF4F3F5),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (states) => const Color(0xff0004FF),
    ),
    // (states) => const Color(0xff04b98c)),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
  ),

  tabBarTheme: const TabBarTheme(labelColor: Colors.black),
  textTheme: const TextTheme(),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: Colors.red,
    selectedItemColor: Color(0xff008EF9),
  ),
  cardColor: Colors.white70,
  shadowColor: Color(0xFF1B1B1B),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xffF4F3F5),
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),


dividerColor: Colors.black, 

);

// ------------- DARK MODE ---------------------------
ThemeData darkTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xffFFB700),
    brightness: Brightness.dark,
  ),
  primaryColor: const Color(0xff75F9FE),
  primaryColorDark: const Color(0xffFFB700),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: const Color(0xffFFB700),
      foregroundColor: Colors.black,
    ),
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff171d29)),

  scaffoldBackgroundColor: const Color(0xff1B1B1B),
  canvasColor: const Color(0xff242426),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (states) => const Color(0xffFFB700),
    ),
  ),

  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1B1B1B),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff1B1B1B),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardColor: const Color(0xff29313c),
  shadowColor: Color(0xffFFFFFF),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff04b98c),
    textTheme: ButtonTextTheme.primary,
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        const Color(0xffFFB700),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey, // Grey border color
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(20.0), // Rounded corners
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey, // Grey border color
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),


    dividerColor: Colors.white,
);
