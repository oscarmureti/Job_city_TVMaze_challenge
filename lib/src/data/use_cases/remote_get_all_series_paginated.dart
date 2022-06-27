import 'package:flutter/foundation.dart';
import 'package:job_city_challenge/src/data/http/http_client.dart';
import 'package:job_city_challenge/src/data/http/http_error.dart';
import 'package:job_city_challenge/src/data/models/get_all_series/series_basic_info_model.dart';
import 'package:job_city_challenge/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:job_city_challenge/src/domain/errors/domain_error.dart';
import 'package:job_city_challenge/src/domain/use_cases/get_all_series/get_all_series_paginated_use_case.dart';

class RemoteGetAllSeriesPaginated implements GetAllSeriesPaginatedUseCase {
  final HttpClient client;
  final String url;

  const RemoteGetAllSeriesPaginated({
    required this.client,
    required this.url,
  });

  @override
  Future<List<SeriesBasicInfoEntity>> call(
      {required GetAllSeriesPaginatedUseCaseParams params}) async {
    try {
      final result = await client.request(
        url: url,
        method: RequestMethod.get,
        queryParameters:
            GetAllSeriesPaginatedUseCaseParamsModel.fromEntity(params).toMap(),
      );

      final seriesListResult = (result as List)
          .map((item) =>
              SeriesBasicInfoModel.fromMap(item as Map<String, dynamic>))
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

class GetAllSeriesPaginatedUseCaseParamsModel
    extends GetAllSeriesPaginatedUseCaseParams {
  GetAllSeriesPaginatedUseCaseParamsModel({required int page})
      : super(page: page);

  factory GetAllSeriesPaginatedUseCaseParamsModel.fromEntity(
      GetAllSeriesPaginatedUseCaseParams entity) {
    return GetAllSeriesPaginatedUseCaseParamsModel(page: entity.page);
  }

  Map<String, dynamic> toMap() {
    return {'page': page};
  }
}
