import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/api_service/api_service.dart';
import 'package:news/data/data_source_contract/sources_data_source.dart';
import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/models/category_model.dart';
@Injectable(as: SourcesDataSource)
class SourcesApiDataSourceImpl implements SourcesDataSource{
  ApiService apiService;
  @factoryMethod
  SourcesApiDataSourceImpl({required this.apiService});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) {
    return apiService.getSources(category);

  }



}