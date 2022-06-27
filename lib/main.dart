import 'package:flutter/material.dart';
import 'src/dependency_injection/injection_container.dart' as di;
import 'package:get/get.dart';
import 'package:job_city_challenge/src/ui/themes/app_theme.dart';
import 'package:job_city_challenge/src/routes/app_pages.dart';
import 'package:flutter/services.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Job city flutter challenge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainThemeData,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
    );
  }
}
