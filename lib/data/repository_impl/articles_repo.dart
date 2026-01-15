import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/data_source_contract/articles_data_source.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/entites/source_entity.dart';
import '../../domain/repository_contract/articles_repo.dart';
@Injectable(as: ArticlesRepo )
class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesDataSource articlesDataSource;
  @factoryMethod
  ArticlesRepoImpl({required this.articlesDataSource});

  @override
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity source,{ required int pageNumber })async {
 var result =await articlesDataSource.getArticles(source,pageNumber: pageNumber);
 switch(result) {
   case Success<List<Articles>>():
   return Success(data: result.data.map((article) => article.toArticleEntity(),).toList());
   case ServerError<List<Articles>>():
    return  ServerError(code: result.code, message: result.message);
   case GeneralError<List<Articles>>():
    return GeneralError(exception: result.exception);
 }
  }
}