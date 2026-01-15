import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/data_source_contract/sources_data_source.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/domain/entites/source_entity.dart';
import 'package:news/models/category_model.dart';

import '../../domain/repository_contract/sources_repo.dart';
@Injectable(as: SourcesRepo)
class SourcesRepoImpl implements SourcesRepo{
  SourcesDataSource dataSource;
  @factoryMethod
  SourcesRepoImpl({required this.dataSource});


  @override
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category)async {
    var result = await  dataSource.getSources(category);
    switch(result) {
      case Success<List<Source>>():
     return   Success(data: result.data.map((e) => e.toSourceEntity(),).toList());
      case ServerError<List<Source>>():
    return ServerError(code: result.code, message: result.message);
      case GeneralError<List<Source>>():
       return GeneralError(exception: result.exception);
    }
  }}