import 'package:flutter/material.dart';

ThemeData AppTheme(){
  return ThemeData(
      textTheme: AppTextTheme(),
      primaryColor: Color(0xFF00796B),
      buttonTheme: CustomButtonThemeData(),
      buttonColor: Color(0xFFffffff),
      highlightColor: Colors.white70

  );
}
TextTheme AppTextTheme() {
  return TextTheme(
      headline6: TextStyle(

      )

  );
}
ButtonThemeData CustomButtonThemeData(){
  return ButtonThemeData(
    buttonColor: Color(0xFF00796B),

  );
}