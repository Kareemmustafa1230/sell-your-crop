import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import '../../../cart/ui/screen/cart.dart';
import '../../../home_screen/ui/screen/home.dart';
import '../../../search/ui/screen/search.dart';
import '../../../setting/ui/screen/setting.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});
  @override
  State<HomeScreenWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenWidget> {
  int _page = 0 ;
  List<NavItem> navItems = [
    NavItem(icon:CupertinoIcons.home, size: 33, unselectedSize: 30, color: Colors.grey),
    NavItem(icon: CupertinoIcons.search, size: 33, unselectedSize: 30, color: Colors.grey),
    NavItem(icon: CupertinoIcons.cart, size: 33, unselectedSize: 30, color: Colors.grey),
    NavItem(icon: Icons.menu, size: 33, unselectedSize: 30, color: Colors.grey),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFFFFFFF),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 600),
        index: _page,
        buttonBackgroundColor: ColorApp.green73,
        color: CupertinoColors.extraLightBackgroundGray,
        height: 60,
        animationCurve: Curves.linearToEaseOut,
        backgroundColor: CupertinoColors.transparent,
        items: navItems
            .map((item) => Icon(
          item.icon,
          size: _page == navItems.indexOf(item) ? item.size : item.unselectedSize,
          color: _page == navItems.indexOf(item) ? Colors.black : item.color,
        ))
            .toList(),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body:taps[_page] ,
    );
  }

  List<Widget> taps = [
    const HomePage() , const Search(), const Cart(),const Setting(),
  ];
}

class NavItem {
  final IconData icon;
  final double size;
  final double unselectedSize;
  final Color color;
  NavItem({required this.icon, required this.size, required this.unselectedSize, required this.color});
}
