import 'package:news/core/result.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/models/category_model.dart';

abstract class SourcesRepo{
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category);
}