import 'package:flutter/material.dart';
import 'package:news/config/theme.dart';

class   ConfigProvider extends ChangeNotifier{
String currentLang ="en";
ThemeMode currentTheme =ThemeMode.dark;
bool get isEnglish=> currentLang=="en";
bool get isDark =>currentTheme==ThemeMode.dark;

void changeLanguage(String newLang){
  if(newLang ==currentLang)return;
  currentLang =newLang;
  notifyListeners();
}
void changeTheme(ThemeMode newTheme){
  if(newTheme==currentTheme)return;
  currentTheme=newTheme;
  notifyListeners();
}


}