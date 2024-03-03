import 'package:flutter/material.dart';

// Define a custom theme
ThemeData myCustomTheme = ThemeData(
  // Define the primary color
  primaryColor: Colors.blue,
  // Define the accent color

  // Define the text theme
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  // Define the button theme
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    textTheme: ButtonTextTheme.primary,
  ),
  // Define the app bar theme
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,



  ),
  // Define the bottom navigation bar theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.blue,
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
  ),
  // Define the card theme
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.black54,
    elevation: 5.0,
  ),
  // Define the dialog theme
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.blue, fontSize: 20),
    contentTextStyle: TextStyle(color: Colors.black, fontSize: 16),
  ),
  // Define the floating action button theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
  // Define the slider theme
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.orange,
    inactiveTrackColor: Colors.grey,
    thumbColor: Colors.blue,
  ),
);
