import 'package:flutter/material.dart';
import 'package:medico/AppTheme/AppTheme.dart';
import 'package:medico/ui/Home.dart';
//import 'package:medico/ui/SplashScreen.dart';
import 'package:medico/ui/IntroScreen.dart';
import 'package:medico/ui/login.dart';
import 'package:medico/ui/signUp.dart';
import 'package:medico/widgets/botton_nav_bar.dart';
import 'BlogList.dart';

import 'SearchScreen.dart';
import 'home_remedies.dart';
void main() {
  runApp(MaterialApp(
    //home: IntroScreen(),
    home: IntroScreen(),
    theme: AppTheme(),
  ));
}