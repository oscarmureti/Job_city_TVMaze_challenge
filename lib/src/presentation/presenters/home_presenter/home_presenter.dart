import 'package:job_city_challenge/src/domain/entities/get_all_series/series_basic_info_entity.dart';

import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class HomePresenter {
  void getAllSeries();

  void loadMoreSeries();

  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;

  void goToSearchSeriesPage();

  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity});

  Stream<NavigationArguments> get navigateToWithArgsStream;
}
