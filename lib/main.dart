import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practicaltecherudite/pages/home_page.dart';
import 'package:practicaltecherudite/pages/login_page.dart';
import 'package:practicaltecherudite/responsiv_layout/responsiv_class.dart';

void main() {

  
   SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);  
  runApp(LayoutBuilder(
    builder: (context,constraints) {
      return OrientationBuilder(
        builder: (context,orientation) {
           SizeConfig().init(constraints, orientation);
          return MaterialApp(home: LoginPage(),);
        }
      );
    }
  ));
}




