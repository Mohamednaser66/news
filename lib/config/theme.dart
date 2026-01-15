import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/colors_manager.dart';

class ThemeManager{
  static final ThemeData light =ThemeData(
primaryColor: ColorsManager.white,
    secondaryHeaderColor: ColorsManager.black,
    iconTheme: IconThemeData(color: ColorsManager.black),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: ColorsManager.white,
        foregroundColor: ColorsManager.black,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize: 20 ,color: ColorsManager.black)
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    tabBarTheme: TabBarThemeData(
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w500,color: ColorsManager.black),
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        indicatorColor: ColorsManager.black,
        labelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 16,color: ColorsManager.black)
    ),
      textTheme: TextTheme(
          titleLarge:  GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 24,color: ColorsManager.white),
          titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 16,color: ColorsManager.black),
          bodyMedium: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w500,color: ColorsManager.black),
          titleSmall: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w500,color: ColorsManager.gray)
      )
  );
  static final ThemeData dark =ThemeData(
    primaryColor: ColorsManager.black,
    secondaryHeaderColor: ColorsManager.white,
    iconTheme: IconThemeData(
      color: ColorsManager.white
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize: 20 ,color: ColorsManager.white)
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    tabBarTheme: TabBarThemeData(
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w500,color: ColorsManager.white),
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        indicatorColor: ColorsManager.white,
        labelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 16,color: ColorsManager.white)
    ),
    textTheme: TextTheme(
      titleLarge:  GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 24,color: ColorsManager.black),
      titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 16,color: ColorsManager.white),
      bodyMedium: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w500,color: ColorsManager.white),
      titleSmall: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w500,color: ColorsManager.gray)
    )
  );
}