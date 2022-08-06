import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_characters/extension/extension_mixin.dart';
import 'package:marvel_characters/presentation/router/router.gr.dart';
import 'package:marvel_characters/style/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<AutoRouterState> _routerKey = GlobalKey<AutoRouterState>();
  int _currentIndex = 0;

  final List<BottomTab> _bottomTabs = [
    BottomTab(
      const HomeRoute(),
      (context, {required isActive, required onTap}) => _BottomNavigationIcon(
        iconPath: IconsSvg.home,
        isActive: isActive,
        onTap: onTap,
      ),
    ),
    BottomTab(
      const SearchRoute(),
      (context, {required isActive, required onTap}) => _BottomNavigationIcon(
        iconPath: IconsSvg.search,
        isActive: isActive,
        onTap: onTap,
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _routerKey.currentState?.controller?.push(_bottomTabs.first.router);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AutoRouter(
          key: _routerKey,
        ),
        bottomNavigationBar: _BottomNavigationBar(
            tabs: _bottomTabs,
            currentIndex: _currentIndex,
            onSelected: (int index) {
              _routerKey.currentState?.controller?.replace(_bottomTabs[index].router);
              setState(() {
                _currentIndex = index;
              });
            }),
      );
}

class _BottomNavigationBar extends StatelessWidget {
  final List<BottomTab> tabs;
  final void Function(int index) onSelected;
  final int currentIndex;

  const _BottomNavigationBar({
    required this.tabs,
    required this.currentIndex,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomAppBar(
      color: context.getColors().bgColor,
      child: Container(
        height: kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
        decoration: BoxDecoration(
          color: context.getColors().bgColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0, -8),
              color: context.getColors().grey,
              spreadRadius: -10.r,
              blurRadius: 6.r,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            tabs.length,
            (index) =>
                tabs[index].iconBuilder(context, isActive: currentIndex == index, onTap: () => onSelected(index)),
          ),
        ),
      ));
}

class _BottomNavigationIcon extends StatelessWidget {
  final String iconPath;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavigationIcon({
    required this.iconPath,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SvgPicture.asset(
          iconPath,
          color: isActive ? context.getColors().white : context.getColors().grey,
          height: 30.h,
        ),
      );
}

class BottomTab {
  final PageRouteInfo<dynamic> router;
  final Widget Function(
    BuildContext context, {
    required bool isActive,
    required VoidCallback onTap,
  }) iconBuilder;

  BottomTab(this.router, this.iconBuilder);
}
