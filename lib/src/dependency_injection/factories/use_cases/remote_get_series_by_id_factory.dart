import 'package:job_city_challenge/src/data/use_cases/remote_get_series_by_id.dart';
import 'package:job_city_challenge/src/dependency_injection/factories/http/api_url_factory.dart';
import 'package:job_city_challenge/src/dependency_injection/injection_container.dart';
import 'package:job_city_challenge/src/domain/use_cases/get_series_by_id/get_series_by_id_use_case.dart';

import '../../../data/http/http_client.dart';

GetSeriesByIdUseCase makeRemoteGetSeriesById() => RemoteGetSeriesById(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/shows'),
    );
