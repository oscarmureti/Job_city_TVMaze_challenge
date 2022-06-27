import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_city_challenge/src/presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';

import '../../../themes/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final MainNavigationPresenter presenter;
  const CustomBottomNavigationBar({Key? key, required this.presenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: presenter.index,
      initialData: 0,
      builder: (context, snapshot) {
        return _buildBottomNavigation(
            context: context,
            index: snapshot.data!,
            onTap: (int index) {
              presenter.setIndex = index;
            });
      },
    );
  }

  Widget _buildBottomNavigation({
    required BuildContext context,
    required int index,
    required void Function(int index) onTap,
  }) {
    return BottomNavyBar(
      backgroundColor: Colors.black,
      selectedIndex: index,
      onItemSelected: onTap,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(
            Icons.home,
            size: 16,
          ),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 14),
          ),
          activeColor: Color(0xFFFDB730),
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.favorite_outline,
            size: 16,
          ),
          title: Text(
            'Fovourite',
            style: TextStyle(fontSize: 14),
          ),
          activeColor: Color(0xFFFDB730),
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.people,
            size: 16,
          ),
          title: Text(
            'People',
            style: TextStyle(fontSize: 14),
          ),
          activeColor: Color(0xFFFDB730),
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.settings,
            size: 16,
          ),
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 14),
          ),
          activeColor: Color(0xFFFDB730),
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildIcon({required String path, required Color color}) {
    return SvgPicture.asset(
      path,
      color: color,
      width: 24,
      height: 24,
    );
  }
}
