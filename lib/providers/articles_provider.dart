import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/domain/use_cases/get_articles_usecase.dart';


@injectable
class ArticlesProvider extends ChangeNotifier{
GetArticlesUseCase useCase;
List<ArticleEntity> articlesList =[];
@factoryMethod
ArticlesProvider({required this.useCase});
ArticlesState state =ArticlesLoadingState();
emit(ArticlesState newState){
  state =newState;
  notifyListeners();
  
}
   void getArticles(SourceEntity source,{int pageNumber =1})async{
    var result = await useCase.invoke(source,pageNumber: pageNumber);
    switch(result) {
      case Success<List<ArticleEntity>>():
        articlesList.addAll(result.data);
      emit(ArticlesSuccessState(articles:result.data));

      case ServerError<List<ArticleEntity>>():
        emit(ArticlesErrorState(serverError: result,));
      case GeneralError<List<ArticleEntity>>():
       emit(ArticlesErrorState(generalError: result.exception));
    }
    notifyListeners();
  }

}
sealed class ArticlesState{

}

class ArticlesLoadingState extends ArticlesState{
  final String? loadingMessage;
   ArticlesLoadingState({ this.loadingMessage});
}
class ArticlesSuccessState extends ArticlesState{
  List<ArticleEntity> articles;
    ArticlesSuccessState({required this.articles});
}
class ArticlesErrorState extends ArticlesState{
  ServerError? serverError;
  Exception? generalError;
  ArticlesErrorState({this.generalError,this.serverError});

}