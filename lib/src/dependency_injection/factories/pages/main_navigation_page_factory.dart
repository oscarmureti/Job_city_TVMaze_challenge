import 'package:flutter/material.dart';
import 'package:job_city_challenge/src/presentation/presenters/splash_presenter/splash_presenter.dart';

import '../../../presentation/presenters/favorites_presenter/favorites_presenter.dart';
import '../../../presentation/presenters/home_presenter/home_presenter.dart';
import '../../../presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';
import '../../../presentation/presenters/people_presenter/people_presenter.dart';
import '../../../ui/pages/main_navigation/main_navigation_page.dart';
import '../../injection_container.dart';

Widget makeMainNavigationPage() => MainNavigationPage(
      mainNavigationPresenter: serviceLocator<MainNavigationPresenter>(),
      homePresenter: serviceLocator<HomePresenter>(),
      favoritesPresenter: serviceLocator<FavoritesPresenter>(),
      peoplePresenter: serviceLocator<PeoplePresenter>(),
      presenter: serviceLocator<SplashPresenter>(),
    );
