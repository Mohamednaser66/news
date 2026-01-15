import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/api_service/api_service.dart';
import 'package:news/data/data_source_contract/articles_data_source.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:news/domain/entites/source_entity.dart';
@ Injectable(as: ArticlesDataSource )
class ArticlesApiDataSourceImpl implements ArticlesDataSource{
  ApiService apiService;
  @factoryMethod
  ArticlesApiDataSourceImpl({required this.apiService});


  @override
  Future<Result<List<Articles>>> getArticles(SourceEntity source,{required int pageNumber })async {
  return await apiService.getArticles(source,pageNumber: pageNumber);
  }}