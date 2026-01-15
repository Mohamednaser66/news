import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/data_source_contract/search_data_source.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/repository_contract/search_repo.dart';



@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  SearchDataSource dataSource;
  @factoryMethod
  SearchRepoImpl({required this.dataSource});
  @override
  Future<Result<List<ArticleEntity>>> search(String query)async {
     var  result = await dataSource.search(query);
     switch(result) {
       case Success<List<Articles>>():
       return Success(data: result.data.map((article) =>article.toArticleEntity()).toList());
       case ServerError<List<Articles>>():
       return ServerError(code: result.code, message: result.message);
       case GeneralError<List<Articles>>():
      return  GeneralError(exception: result.exception);
     }
  }
}