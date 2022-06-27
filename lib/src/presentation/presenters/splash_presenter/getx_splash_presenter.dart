import 'package:job_city_challenge/src/presentation/mixins/navigation_manager/navigation_arguments.dart';
import 'package:job_city_challenge/src/presentation/mixins/navigation_manager/presenter_navigation_manager.dart';
import 'package:job_city_challenge/src/routes/app_routes.dart';
import 'package:get/get.dart';

import 'splash_presenter.dart';

class GetxSplashPresenter extends GetxController
    with PresenterNavigationManager
    implements SplashPresenter {
  @override
  void goToMainPage() {
    navigateToWithArgs = const NavigationArguments(AppRoutes.mainNavigationPage,
        clearStack: true);
  }
}
