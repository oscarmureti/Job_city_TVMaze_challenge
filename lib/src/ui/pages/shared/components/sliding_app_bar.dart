import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../themes/app_colors.dart';

class SlidingAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final ScrollController scrollController;
  final void Function()? action;
  final Widget icon;
  final bool enableAnimation;

  const SlidingAppBar({
    Key? key,
    required this.scrollController,
    required this.action,
    required this.title,
    required this.icon,
    this.enableAnimation = true,
  }) : super(key: key);

  @override
  State<SlidingAppBar> createState() => _SlidingAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _SlidingAppBarState extends State<SlidingAppBar>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  bool _visible = true;

  final duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: duration, vsync: this);

    widget.scrollController.addListener(() {
      final direction = widget.scrollController.position.userScrollDirection;

      if (direction == ScrollDirection.reverse) {
        setState(() {
          _visible = false;
        });
      } else {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enableAnimation) {
      _visible ? animationController.reverse() : animationController.forward();
    }

    return AnimatedContainer(
      height: Tween<double>(begin: 80, end: 0)
          .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear),
          )
          .value,
      duration: duration,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
        ),
        actions: [
          IconButton(
            onPressed: widget.action,
            icon: widget.icon,
          ),
        ],
      ),
    );
  }
}
