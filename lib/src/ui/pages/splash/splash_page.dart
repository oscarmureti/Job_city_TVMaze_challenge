import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_city_challenge/src/presentation/presenters/splash_presenter/splash_presenter.dart';
import 'package:job_city_challenge/src/ui/mixins/navigation_manager.dart';
import 'package:job_city_challenge/src/ui/pages/personal_info/set_name.dart';
import 'package:job_city_challenge/src/ui/pages/personal_info/set_pin.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;
  const SplashPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with NavigationManager {
  @override
  void initState() {
    super.initState();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
    retrieveStringValue();
    super.initState();
  }

  retrieveStringValue() async {
    var prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt("pin");
    if (value != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PinScreen(value: value, presenter: widget.presenter),
            ),
            (Route<dynamic> route) => false);
      });
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PersonalInfoScreen(presenter: widget.presenter),
            ),
            (Route<dynamic> route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(
            'assets/images/giphy.gif',
            width: 150,
            height: 150,
          ),
        ));
  }
}
