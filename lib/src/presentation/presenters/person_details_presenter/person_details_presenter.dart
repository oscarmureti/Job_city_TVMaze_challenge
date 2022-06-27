import 'package:job_city_challenge/src/domain/entities/get_cast_credits/cast_credit_info_entity.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class PersonDetailsPresenter {
  Stream<NavigationArguments> get navigateToWithArgsStream;

  void getCastCredits({required String personId});

  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity});

  Stream<List<CastCreditInfoEntity>> get castCreditListStream;
}
