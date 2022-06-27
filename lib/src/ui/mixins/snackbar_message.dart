import 'package:flutter/material.dart';
import 'package:job_city_challenge/src/ui/themes/app_colors.dart';

mixin SnackbarMessage {
  void showSnackbar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColors.white,
              ),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
