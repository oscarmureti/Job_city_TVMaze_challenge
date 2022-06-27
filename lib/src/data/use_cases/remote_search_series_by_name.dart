import 'package:flutter/foundation.dart';
import 'package:job_city_challenge/src/data/http/http_client.dart';
import 'package:job_city_challenge/src/data/http/http_error.dart';
import 'package:job_city_challenge/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:job_city_challenge/src/domain/errors/domain_error.dart';
import 'package:job_city_challenge/src/domain/use_cases/search_series/search_series_by_name_use_case.dart';

import '../models/get_all_series/series_basic_info_model.dart';

class RemoteSearchSeriesByName implements SearchSeriesByNameUseCase {
  final HttpClient client;
  final String url;

  RemoteSearchSeriesByName({
    required this.client,
    required this.url,
  });

  @override
  Future<List<SeriesBasicInfoEntity>> call(
      {required String searchInput}) async {
    try {
      final queryParams = {'q': searchInput};
      final result = await client.request(
          url: url, method: RequestMethod.get, queryParameters: queryParams);

      final seriesListResult = (result as List)
          .map((item) => SeriesBasicInfoModel.fromMap(item['show']))
          .toList();

      return seriesListResult;
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError {
      rethrow;
    }
  }
}
