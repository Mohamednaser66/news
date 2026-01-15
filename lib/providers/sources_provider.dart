import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/domain/use_cases/get_sources.dart';
import 'package:news/models/category_model.dart';


@injectable
class SourcesProvider extends ChangeNotifier{
  GetSourcesUseCases useCases;
  @factoryMethod
  SourcesProvider({required this.useCases});
  SourcesState state =SourcesLoadingState();
  emit(SourcesState newState){
    state=newState;
    notifyListeners();
  }
  loadSources(CategoryModel category)async{
    Result<List<SourceEntity>> result =await useCases.invoke(category);
    switch(result){

      case Success<List<SourceEntity>>():
        emit(SourcesSuccessState(sources: result.data));
      case ServerError<List<SourceEntity>>():
      emit(SourcesErrorState(serverError: result));
      case GeneralError<List<SourceEntity>>():
    emit(SourcesErrorState(exception: result.exception));
    }


    }
  }





sealed class SourcesState{}

class SourcesLoadingState extends SourcesState{
  String? loadingMessage;
  SourcesLoadingState({this.loadingMessage});
}
class SourcesSuccessState extends SourcesState{
  List<SourceEntity> sources;
  SourcesSuccessState({required this.sources});
}
class SourcesErrorState extends SourcesState{
  ServerError? serverError;
  Exception? exception;
  SourcesErrorState({this.exception,this.serverError});
}