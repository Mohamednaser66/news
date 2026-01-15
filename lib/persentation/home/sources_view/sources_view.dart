import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/core/di/di.dart';
import 'package:news/core/widget/error_stste_widget.dart';
import 'package:news/data/api_service/api_service.dart';
import 'package:news/data/data_source_impl/articles_data_source.dart';
import 'package:news/data/data_source_impl/sources_data_source.dart';
import 'package:news/data/repository_impl/articles_repo.dart';
import 'package:news/data/repository_impl/sources_repo.dart';
import 'package:news/domain/use_cases/get_articles_usecase.dart';
import 'package:news/domain/use_cases/get_sources.dart';
import 'package:news/models/category_model.dart';
import 'package:news/persentation/home/sources_view/article_item.dart';
import 'package:news/providers/articles_provider.dart';
import 'package:news/providers/sources_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/images_manager.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key,required this.category});
 final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {



  @override
  late SourcesProvider sourcesProvider;
  late ArticlesProvider articlesProvider;
  late ScrollController controller;
  int page =1;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

    controller =ScrollController();
    controller.addListener((){
      if(controller.position.atEdge){
        if(controller.position.pixels !=0){
          articlesProvider.getArticles((sourcesProvider.state as SourcesSuccessState).sources[0], pageNumber: page++);

        }
      }
    });


  }


  loadData()async{
    sourcesProvider =getIt<SourcesProvider>();
    articlesProvider=getIt<ArticlesProvider>();
    await sourcesProvider.loadSources(widget.category);
    articlesProvider.getArticles((sourcesProvider.state as SourcesSuccessState).sources[0]);


  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(16.0),
      child:  MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: sourcesProvider),
          ChangeNotifierProvider.value(value: articlesProvider)

        ],
        child: Column(
            children: [
            Consumer<SourcesProvider>(builder:(context, provider, child) {
              var state =provider.state;
              switch(state) {
                case SourcesLoadingState():
              return  Center(child: CircularProgressIndicator(color: ColorsManager.white,),);
                case SourcesSuccessState():
                  return DefaultTabController(
                      length: state.sources.length,
                      child: TabBar(
                          onTap: (index) {
                            articlesProvider.getArticles(state.sources[index]);
                            articlesProvider.articlesList.clear();
                          },
                          isScrollable: true,
                          tabs: state.sources.map((source) => Tab(text: source.name,),).toList()));
                case SourcesErrorState():
               return ErrorStateWidget(serverError: state.serverError,exception: state.exception,);
              }


            }  ,

            ),
        SizedBox(height: 24.h,),
        Consumer<ArticlesProvider>(builder: (context, viewModel, child) {
          var state =viewModel.state;
          switch(state) {
            case ArticlesLoadingState():
              return Expanded(child: Center(child: CircularProgressIndicator(color: ColorsManager.white,),));
            case ArticlesSuccessState():
            return Expanded(child: ListView.separated(controller:controller ,
              itemBuilder: (context, index) =>ArticleItem(article: viewModel.articlesList[index]),
              separatorBuilder: (context, index) => SizedBox(height: 10.h,),
              itemCount:  viewModel.articlesList.length,));
            case ArticlesErrorState():
        return ErrorStateWidget(exception: state.generalError,serverError: state.serverError,);
          }


        }

        )
        ]
        ),
      ),
    );

  }
}
