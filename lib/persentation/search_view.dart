import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/core/di/di.dart';
import 'package:news/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/widget/error_stste_widget.dart';
import 'home/sources_view/article_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController searchController;
 late SearchProvider provider;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController=TextEditingController();
    initProvider();
  }

  initProvider(){
   provider=getIt<SearchProvider>();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChangeNotifierProvider(create: (context) => provider,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => provider.search(value),
                  controller: searchController,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(

                      hintText: AppLocalizations.of(context)!.search,hintStyle: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.w400),
                      prefixIcon: Icon(Icons.search,color: ColorsManager.white,),
                      suffixIcon: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.close,color: ColorsManager.white,)),
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r)
                        ,borderSide: BorderSide(color: ColorsManager.white,)
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: ColorsManager.white,)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: ColorsManager.white,)
                    )

                  ),
                ),
                SizedBox(height: 16.h,),
                Consumer<SearchProvider>(builder: (context, provider, child) {
                  var state =provider.state;

                switch(state) {
                  case ArticlesSuccessState():
                  if(state.articles.isEmpty){
                    return Text(AppLocalizations.of(context)!.not_found);
                  }else {
                    return Expanded(child: ListView.separated(
                      itemBuilder: (context, index) =>
                          ArticleItem(article: state.articles[index],),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h,),
                      itemCount: state.articles.length,));
                  }
                  case ArticlesLoadingState():
                   return  Center(child: CircularProgressIndicator());

                  case ArticlesErrorState():
                    return ErrorStateWidget(serverError: state.serverError,exception: state.generalError,);


                }

                }
                ,)
              ],
            ),
          ),
        ),
      ),
    );

  }
}
