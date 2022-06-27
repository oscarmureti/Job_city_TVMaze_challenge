import 'package:flutter/material.dart';
import 'package:job_city_challenge/src/ui/pages/personal_info/set_pin.dart';

import '../../../presentation/presenters/splash_presenter/splash_presenter.dart';
import '../../injection_container.dart';

Widget makePinPage() => PinScreen(presenter: serviceLocator<SplashPresenter>());
