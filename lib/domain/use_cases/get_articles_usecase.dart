import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/domain/repository_contract/articles_repo.dart';
@injectable
class GetArticlesUseCase{
  ArticlesRepo repo;
  @factoryMethod
  GetArticlesUseCase({required this.repo});
  Future<Result<List<ArticleEntity>>>  invoke(SourceEntity source,{required int pageNumber}){
    return repo.getArticles(source,pageNumber: pageNumber);
  }
}