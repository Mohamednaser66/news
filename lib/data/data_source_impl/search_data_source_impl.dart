import 'package:injectable/injectable.dart';
import 'package:news/core/result.dart';
import 'package:news/data/api_service/api_service.dart';
import 'package:news/data/data_source_contract/search_data_source.dart';
import 'package:news/data/models/articles_response/Articles.dart';
@Injectable(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource{
  ApiService apiService;
  @factoryMethod
  SearchDataSourceImpl({required this.apiService});
  @override
  Future<Result<List<Articles>>> search(String query)async => await apiService.search(query);

}