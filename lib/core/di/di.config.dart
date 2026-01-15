// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_service/api_service.dart' as _i790;
import '../../data/data_source_contract/articles_data_source.dart' as _i435;
import '../../data/data_source_contract/search_data_source.dart' as _i14;
import '../../data/data_source_contract/sources_data_source.dart' as _i1058;
import '../../data/data_source_impl/articles_data_source.dart' as _i948;
import '../../data/data_source_impl/search_data_source_impl.dart' as _i949;
import '../../data/data_source_impl/sources_data_source.dart' as _i225;
import '../../data/repository_impl/articles_repo.dart' as _i193;
import '../../data/repository_impl/search_repo.dart' as _i877;
import '../../data/repository_impl/sources_repo.dart' as _i986;
import '../../domain/repository_contract/articles_repo.dart' as _i930;
import '../../domain/repository_contract/search_repo.dart' as _i189;
import '../../domain/repository_contract/sources_repo.dart' as _i134;
import '../../domain/use_cases/get_articles_usecase.dart' as _i2;
import '../../domain/use_cases/get_sources.dart' as _i618;
import '../../domain/use_cases/search_usecase.dart' as _i34;
import '../../providers/articles_provider.dart' as _i183;
import '../../providers/search_provider.dart' as _i771;
import '../../providers/sources_provider.dart' as _i438;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i790.ApiService>(() => _i790.ApiService());
    gh.factory<_i1058.SourcesDataSource>(
      () => _i225.SourcesApiDataSourceImpl(apiService: gh<_i790.ApiService>()),
    );
    gh.factory<_i435.ArticlesDataSource>(
      () => _i948.ArticlesApiDataSourceImpl(apiService: gh<_i790.ApiService>()),
    );
    gh.factory<_i14.SearchDataSource>(
      () => _i949.SearchDataSourceImpl(apiService: gh<_i790.ApiService>()),
    );
    gh.factory<_i134.SourcesRepo>(
      () => _i986.SourcesRepoImpl(dataSource: gh<_i1058.SourcesDataSource>()),
    );
    gh.factory<_i618.GetSourcesUseCases>(
      () => _i618.GetSourcesUseCases(sourcesRepo: gh<_i134.SourcesRepo>()),
    );
    gh.factory<_i930.ArticlesRepo>(
      () => _i193.ArticlesRepoImpl(
        articlesDataSource: gh<_i435.ArticlesDataSource>(),
      ),
    );
    gh.factory<_i438.SourcesProvider>(
      () => _i438.SourcesProvider(useCases: gh<_i618.GetSourcesUseCases>()),
    );
    gh.factory<_i189.SearchRepo>(
      () => _i877.SearchRepoImpl(dataSource: gh<_i14.SearchDataSource>()),
    );
    gh.factory<_i34.SearchUseCase>(
      () => _i34.SearchUseCase(repo: gh<_i189.SearchRepo>()),
    );
    gh.factory<_i2.GetArticlesUseCase>(
      () => _i2.GetArticlesUseCase(repo: gh<_i930.ArticlesRepo>()),
    );
    gh.factory<_i183.ArticlesProvider>(
      () => _i183.ArticlesProvider(useCase: gh<_i2.GetArticlesUseCase>()),
    );
    gh.factory<_i771.SearchProvider>(
      () => _i771.SearchProvider(gh<_i34.SearchUseCase>()),
    );
    return this;
  }
}
