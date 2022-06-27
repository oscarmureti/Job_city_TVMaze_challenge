import 'package:job_city_challenge/src/data/use_cases/remote_get_all_favorite_series.dart';
import 'package:job_city_challenge/src/dependency_injection/injection_container.dart';
import 'package:job_city_challenge/src/domain/use_cases/get_all_favorite_series/get_all_favorite_series_use_case.dart';

import '../../../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import '../../../domain/use_cases/get_series_by_id/get_series_by_id_use_case.dart';

GetAllFavoriteSeriesUseCase makeRemoteGetAllFavoriteSeries() =>
    RemoteGetAllFavoriteSeries(
      fetchAllFavoriteSeriesIdsUseCase:
          serviceLocator<FetchAllFavoriteSeriesIdsUseCase>(),
      getSeriesByIdUseCase: serviceLocator<GetSeriesByIdUseCase>(),
    );
