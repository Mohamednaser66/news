import 'package:news/core/result.dart';
import 'package:news/data/models/articles_response/Articles.dart';

abstract class SearchDataSource{
  Future<Result<List< Articles>>> search(String query);
}