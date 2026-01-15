import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/domain/repository_contract/sources_repo.dart';
import 'package:news/models/category_model.dart';
@injectable
class GetSourcesUseCases{
  SourcesRepo sourcesRepo;
  @factoryMethod
  GetSourcesUseCases({required this.sourcesRepo});
  Future<Result<List<SourceEntity>>> invoke(CategoryModel category){
  return  sourcesRepo.getSources(category);
  }
}