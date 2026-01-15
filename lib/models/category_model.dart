import 'package:flutter/material.dart';
import 'package:news/core/images_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryModel {
  final String id;
  final String title;
  final String imagePath;
  CategoryModel({required this.id,required this.title,required this.imagePath});
  static List<CategoryModel> categories =[
    CategoryModel(id:'general', title: 'General', imagePath: ImagesManager.general),
    CategoryModel(id:'business', title: 'Business', imagePath: ImagesManager.business),
    CategoryModel(id:'entertainment', title: 'Entertainment', imagePath: ImagesManager.entertainment),
    CategoryModel(id:'health', title: 'Health', imagePath: ImagesManager.health),
    CategoryModel(id:'science', title: 'Science', imagePath: ImagesManager.science),
    CategoryModel(id:'technology', title: 'Technology', imagePath: ImagesManager.technology),
    CategoryModel(id:'sports', title: 'Sports', imagePath: ImagesManager.sports),
  ];
  String getCategoryTitle(BuildContext context,String key){
    final l10n = AppLocalizations.of(context)!;
    switch (key) {
      case 'general':
        return l10n.general;
      case 'business':
        return l10n.business;
      case 'entertainment':
        return l10n.entertainment;
      case 'health':
        return l10n.health;
      case 'science':
        return l10n.science;
      case 'technology':
        return l10n.technology;
      case 'sports':
        return l10n.sports;
      default:
        return key;
    }
  }

}