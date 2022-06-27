import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../shared/components/sliding_app_bar.dart';

class SearchPeopleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ScrollController controller;
  final void Function(String text) onChanged;

  const SearchPeopleAppBar({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SlidingAppBar(
          title: 'People',
          scrollController: controller,
          action: null,
          enableAnimation: false,
          icon: const SizedBox(),
        ),
        AppBar(
          foregroundColor: AppColors.black,
          backgroundColor: Colors.black,
          title: TextField(
            style: Theme.of(context).textTheme.bodyText1,
            onChanged: onChanged,
            onSubmitted: onChanged,
            decoration: InputDecoration(
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(8),
              fillColor: AppColors.grey,
              filled: true,
              suffixIcon: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Search People by Name',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.grey1),
            ),
          ),
          elevation: 0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    final size = AppBar().preferredSize;

    return Size(size.width, size.height * 3);
  }
}
