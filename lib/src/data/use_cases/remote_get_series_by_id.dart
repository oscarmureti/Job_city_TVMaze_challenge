import 'package:job_city_challenge/src/data/http/http_client.dart';
import 'package:job_city_challenge/src/data/http/http_error.dart';
import 'package:job_city_challenge/src/data/models/get_all_series/series_basic_info_model.dart';
import 'package:job_city_challenge/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:job_city_challenge/src/domain/errors/domain_error.dart';
import 'package:job_city_challenge/src/domain/use_cases/get_series_by_id/get_series_by_id_use_case.dart';

class RemoteGetSeriesById implements GetSeriesByIdUseCase {
  final HttpClient client;
  final String url;

  const RemoteGetSeriesById({
    required this.client,
    required this.url,
  });

  @override
  Future<SeriesBasicInfoEntity> call({required String id}) async {
    try {
      final composedUrl = '$url/$id';

      final result =
          await client.request(url: composedUrl, method: RequestMethod.get);

      return SeriesBasicInfoModel.fromMap(result);
    } on HttpError catch (e) {
      throw e.convertError();
    } on DomainError {
      rethrow;
    }
  }
}
