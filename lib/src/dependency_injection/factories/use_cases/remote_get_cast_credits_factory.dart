import 'package:job_city_challenge/src/data/use_cases/remote_get_cast_credits.dart';
import 'package:job_city_challenge/src/dependency_injection/factories/http/api_url_factory.dart';
import 'package:job_city_challenge/src/dependency_injection/injection_container.dart';
import 'package:job_city_challenge/src/domain/use_cases/get_cast_credits/get_cast_credits_use_case.dart';

import '../../../data/http/http_client.dart';

GetCastCreditsUseCase makeRemoteGetCastCredits() => RemoteGetCastCredits(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/people'),
    );
