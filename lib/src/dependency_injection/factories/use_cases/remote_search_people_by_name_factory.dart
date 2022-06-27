import 'package:job_city_challenge/src/data/use_cases/remote_search_people_by_name.dart';
import 'package:job_city_challenge/src/dependency_injection/factories/http/api_url_factory.dart';
import 'package:job_city_challenge/src/dependency_injection/injection_container.dart';
import 'package:job_city_challenge/src/domain/use_cases/search_people/search_people_by_name_use_case.dart';

import '../../../data/http/http_client.dart';

SearchPeopleByNameUseCase makeRemoteSearchPeopleByName() =>
    RemoteSearchPeopleByName(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/search/people'),
    );
