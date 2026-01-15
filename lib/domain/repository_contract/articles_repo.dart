import 'package:news/core/result.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/domain/entites/source_entity.dart';

abstract class ArticlesRepo{
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity source,{required int pageNumber});
}