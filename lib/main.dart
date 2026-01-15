import 'package:flutter/material.dart';
import 'package:news/news_app.dart';
import 'package:news/providers/home_provider.dart';
import 'package:news/providers/config_provider.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';

void main(){
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ChangeNotifierProvider(create: (context) => ConfigProvider(),)
    ],
      child: const NewsApp()));
}