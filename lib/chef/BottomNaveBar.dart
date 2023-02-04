import 'package:chef_ruler/chef/favourits/favourite.dart';
import 'package:chef_ruler/chef/main/views/home.dart';
import 'package:chef_ruler/chef/more/more.dart';
import 'package:chef_ruler/chef/my_orders/orders.dart';
import 'package:chef_ruler/chef/order_basket/order_basket.dart';
import 'package:chef_ruler/core/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNaveBar extends StatefulWidget {
  static const String routeName = 'BottomNaveBar';

  @override
  State<BottomNaveBar> createState() => _BottomNaveBarState();
}

class _BottomNaveBarState extends State<BottomNaveBar> {
  var controller = PersistentTabController();

  List<Widget> _buildScreens() {
    return const [
      MainPage(),
      Orders(),
      OrderBasket(),
      Favourite(),
      More(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("الرئيسيه"),
        activeColorPrimary: MyTheme.redSystem,
        inactiveColorPrimary: MyTheme.darkGray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.news),
        title: ("طلباتي"),
        activeColorPrimary: MyTheme.redSystem,
        inactiveColorPrimary: MyTheme.darkGray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("سله الطلبات"),
        activeColorPrimary: MyTheme.redSystem,
        inactiveColorPrimary: MyTheme.darkGray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("المفضله"),
        activeColorPrimary: MyTheme.redSystem,
        inactiveColorPrimary: MyTheme.darkGray,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.more_horiz),
        title: ("المزيد"),
        activeColorPrimary: MyTheme.redSystem,
        inactiveColorPrimary: MyTheme.darkGray,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInCirc,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.easeInCirc,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style2, // Choose the nav bar style with this property.
      ),
    );
  }
}
