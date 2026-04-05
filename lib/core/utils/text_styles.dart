import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class CustomTextStyles{
  static final archivo400styles64 = TextStyle(
    fontSize: 64.0,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
    fontFamily: 'Archivo',
  );
  static final poppins400styles20White = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  static final poppins400styles18Black = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static final poppins500styles24Black = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static final poppinsBoldStyles18Black = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static final poppinsBoldStyles26 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  static final poppinsStyles14 = TextStyle(
    fontSize: 14.0,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  static final poppins300styles16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: AppColor.greyColor,
    fontFamily: 'Poppins',
  );
  static final poppinsStyles14Blue = TextStyle(
    fontSize: 14.0,
    color:  Color(0xff037EE6),
    fontFamily: 'Poppins',
  );
}