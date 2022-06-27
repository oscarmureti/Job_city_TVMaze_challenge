import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:job_city_challenge/src/data/http/http_client.dart';
import 'package:job_city_challenge/src/data/http/http_error.dart';
import 'package:job_city_challenge/src/data/models/get_series_details/series_detailed_info_model.dart';
import 'package:job_city_challenge/src/domain/entities/get_series_details/series_detailed_info_entity.dart';
import 'package:job_city_challenge/src/domain/errors/domain_error.dart';
import 'package:job_city_challenge/src/domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';

class RemoteFetchSeriesDetails implements FetchSeriesDetailsUseCase {
  final HttpClient client;
  final String url;

  const RemoteFetchSeriesDetails({
    required this.client,
    required this.url,
  });

  @override
  Future<SeriesDetailedInfoEntity> call(
      {required FetchSeriesDetailsUseCaseParams params}) async {
    try {
      final composedUrl = '$url/${params.seriesId}';
      final queryParams = <String, dynamic>{'embed': 'episodes'};

      final result = await client.request(
        url: composedUrl,
        method: RequestMethod.get,
        queryParameters: queryParams,
      );

      return SeriesDetailedInfoModel.fromMap(result);
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError {
      rethrow;
    }
  }
}
