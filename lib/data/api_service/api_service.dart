import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/models/articles_response/ArticalesResponse.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/models/category_model.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/data/models/sources_response/SourcesResponse.dart';


@singleton
class ApiService{

  static const String _apiKey ="48770750cd32436c996efad61f46831d";
  static const String _sourceEndPoint ="/v2/top-headlines/sources";
  static const String _baseUrl ="newsapi.org";
  static const String _articlesEndPoint ="/v2/everything";



   Future<Result<List<Source>>>getSources(CategoryModel category)async{
  try{
    Uri url =Uri.https(_baseUrl,_sourceEndPoint,{
      "apiKey":_apiKey,
      "category":category.id

    });
    http.Response response=  await http.get(url);
    var json =jsonDecode(response.body);
    SourcesResponse sourcesResponse =SourcesResponse.fromJson(json);
    if(sourcesResponse.status=="ok") {
      return Success(data: sourcesResponse.sources!);
    }else{
      return ServerError(code: sourcesResponse.code??'', message: sourcesResponse.message??'');
    }
  }on Exception catch(e){
    return GeneralError(exception: e);
  }
  }

   Future<Result<List<Articles>>>getArticles(SourceEntity source,{ required int pageNumber } )async{
     try{
       Uri url=Uri.https(_baseUrl,_articlesEndPoint,{
         "apiKey":_apiKey,
         "sources":source.id,
         "pageSize":"10",
         "page":pageNumber.toString()
       });
       http.Response response=await http.get(url);
       var json =jsonDecode(response.body);
       ArticalesResponse articlesResponse =ArticalesResponse.fromJson(json);
       if(articlesResponse.status=="ok"){
         return Success(data: articlesResponse.articles!);
       }
       else{
         return  ServerError(code:articlesResponse.code??'', message: articlesResponse.message??'');
       }

     } on Exception catch(e){
      return GeneralError(exception: e);

     }
}
   Future<Result<List<Articles>>>search(String query)async{
     try{
       Uri url=Uri.https(_baseUrl,_articlesEndPoint,{
         "apiKey":_apiKey,
         "q":query
       });
       http.Response response=await http.get(url);
       var json =jsonDecode(response.body);
       ArticalesResponse articlesResponse =ArticalesResponse.fromJson(json);
       if(articlesResponse.status=="ok"){
         return Success(data: articlesResponse.articles!);
       }
       else{
         return  ServerError(code:articlesResponse.code??'', message: articlesResponse.message??'');
       }

     } on Exception catch(e){
      return GeneralError(exception: e);

     }
}
}