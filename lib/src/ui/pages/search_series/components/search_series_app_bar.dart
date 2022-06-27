import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class SearchSeriesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function(String text) onChanged;
  const SearchSeriesAppBar({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.grey,
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black),
          onChanged: onChanged,
          onSubmitted: onChanged,
          decoration: InputDecoration(
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(8),
              fillColor: AppColors.grey,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Hero(
                tag: '-searchIcon-',
                child: Icon(
                  Icons.search,
                  color: AppColors.black,
                ),
              )),
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
