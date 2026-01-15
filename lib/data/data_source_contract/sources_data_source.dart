import 'package:news/core/result.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/models/category_model.dart';

abstract class SourcesDataSource{
 Future<Result<List<Source>>> getSources(CategoryModel category);
}