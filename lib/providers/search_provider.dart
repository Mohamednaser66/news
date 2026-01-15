import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/use_cases/search_usecase.dart';
@injectable
class SearchProvider extends ChangeNotifier{
  SearchUseCase useCase;
  @factoryMethod
  SearchProvider(this.useCase);

  ArticlesState state =ArticlesLoadingState();
  emit(ArticlesState newState){
    state =newState;
    notifyListeners();

  }

  Future<void> search(String query)async{
    notifyListeners();
   var result =await useCase.invoke(query);
   if(query.isEmpty){
     return;
   }
   switch(result) {
     case Success<List<ArticleEntity>>():
       {
        if(query.isNotEmpty){
          emit(ArticlesSuccessState(articles: result.data));
          notifyListeners();
        }else{
          emit(ArticlesSuccessState(articles: result.data =[]));
          notifyListeners();
        }
         break;
       }
     case ServerError<List<ArticleEntity>>():

     emit(ArticlesErrorState(serverError: result,));
      notifyListeners();
      break;

     case GeneralError<List<ArticleEntity>>():

  emit(ArticlesErrorState(generalError: result.exception));
       notifyListeners();
       break;
   }

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
  String? emptyMessage;
  ArticlesSuccessState({required this.articles,this.emptyMessage});
}
class ArticlesErrorState extends ArticlesState{
  ServerError? serverError;
  Exception? generalError;
  ArticlesErrorState({this.generalError,this.serverError});


}

