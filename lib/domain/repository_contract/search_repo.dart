import 'package:news/core/result.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:news/domain/entites/article_entity.dart';

abstract class  SearchRepo{
  Future<Result<List<ArticleEntity>>> search(String query);
}