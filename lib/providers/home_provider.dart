import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/persentation/home/categories_view/categoreis_view.dart';
import 'package:news/persentation/home/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier{
  Widget view =CategoriesView();
  
  void goToCategoriesView(){
    if(view == CategoriesView())return;
    view=CategoriesView();

    notifyListeners();
  }
  void goToSourcesView(CategoryModel category){
    
    view =SourcesView(category: category);
    notifyListeners();
  }
  
  
}