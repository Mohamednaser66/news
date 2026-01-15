import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/repository_contract/search_repo.dart';
@injectable
class SearchUseCase {
  SearchRepo repo;
  @factoryMethod
  SearchUseCase({required this.repo});
  Future<Result<List<ArticleEntity>>> invoke(String query){
    return repo.search(query);

  }

}