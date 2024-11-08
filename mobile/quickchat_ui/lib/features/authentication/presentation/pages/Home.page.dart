import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:quickchat_ui/core/router/app_router.dart';
import 'package:quickchat_ui/features/authentication/presentation/widgets/AuthDetails.widget.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomeNavPage {
  const HomeNavPage({required this.screenRoute, required this.navItem});

  final PageRouteInfo<dynamic> screenRoute;
  final SalomonBottomBarItem navItem;
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late StackRouter router;
  late TabsRouter tabsRouter;
  late ThemeData _theme;

  late MediaQueryData _mediaQuery;
  late bool _isSmallScreen;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    router = AutoRouter.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _mediaQuery = MediaQuery.of(context);
    _isSmallScreen = _mediaQuery.size.height < 684;
    final List<PageRouteInfo<dynamic>> routes =
        _connectlyTabScreens().map((HomeNavPage x) => x.screenRoute).toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          color: _mainContainerColor(),
          child: Container(
            decoration: _mainContainerDecoration(),
            child: PopScope(
              canPop: false,
              child: AutoTabsRouter(
                routes: routes,
                builder: (BuildContext context, Widget child) {
                  tabsRouter = AutoTabsRouter.of(context);
                  return Scaffold(
                    drawer: const Drawer(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: AuthDetailsWidget(),
                    ),
                    backgroundColor: Colors.transparent,
                    appBar: _appBar,
                    body: Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                              width: MediaQuery.of(context).size.width,
                              height: _getConstraintsHeight(
                                  _isSmallScreen, context),
                            ),
                            child: child,
                          ),
                        )
                      ],
                    ),
                    bottomNavigationBar: Container(
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: _bottomNavigation,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _mainContainerColor() {
    return _theme.canvasColor;
  }

  BoxDecoration _mainContainerDecoration() {
    return const BoxDecoration(
      color: Colors.grey,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Colors.transparent,
          Colors.transparent,
        ],
      ),
    );
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
      title: Text(
        tabsRouter.activeIndex == 0 ? 'Chats' : 'Contacts',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        );
      }),
      backgroundColor: Colors.white,
      elevation: 1.0,
      automaticallyImplyLeading: false,
      // actions: [
      //   // _searchAction,
      // ],
    );
  }

  // Widget get _searchAction {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 20.0),
  //     child: GestureDetector(
  //       key: const ValueKey<String>('search-button-key'),
  //       // onTap: _showSearch,
  //       child: const Icon(
  //         FluentIcons.search_12_filled,
  //         size: 26,
  //         color: Colors.black,
  //       ),
  //     ),
  //   );
  // }

  Widget get _bottomNavigation {
    final List<SalomonBottomBarItem> connectlyNavItems =
        _connectlyTabScreens().map((HomeNavPage e) {
      return e.navItem;
    }).toList();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: SalomonBottomBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: _selectNavOption,
        items: connectlyNavItems,
      ),
    );
  }

  List<HomeNavPage> _connectlyTabScreens() {
    return <HomeNavPage>[
      HomeNavPage(
        screenRoute: const ChatsRoute(),
        navItem: _chatsNavItem,
      ),
      HomeNavPage(
        screenRoute: const ContactsRoute(),
        navItem: _contactsNavItem,
      ),
      // HomeNavPage(
      //   screenRoute: const MenuRoute(),
      //   navItem: _menuNavItem,
      // )
    ];
  }

  /// Bottom Navigation Items
  SalomonBottomBarItem get _chatsNavItem => SalomonBottomBarItem(
        icon: _chatsNavIcon,
        activeIcon: _chatsLogNavIconActive,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        selectedColor: Colors.redAccent,
      );

  SalomonBottomBarItem get _contactsNavItem => SalomonBottomBarItem(
        icon: _contactsNavIcon,
        activeIcon: _contactsNavIconActive,
        title: const Text(
          'Contacts',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        selectedColor: Colors.redAccent,
      );

  // SalomonBottomBarItem get _menuNavItem => SalomonBottomBarItem(
  //       icon: _menuNavIcon,
  //       activeIcon: _menuNavIconActive,
  //       title: const Text(
  //         'Menu',
  //         style: TextStyle(
  //           fontSize: 12,
  //         ),
  //       ),
  //       selectedColor: Colors.redAccent,
  //     );

  Widget get _chatsNavIcon {
    return const Icon(FluentIcons.chat_12_regular);
  }

  Widget get _chatsLogNavIconActive {
    return const Icon(FluentIcons.chat_12_filled);
  }

  Widget get _contactsNavIcon {
    return const Icon(FluentIcons.people_chat_16_regular);
  }

  Widget get _contactsNavIconActive {
    return const Icon(FluentIcons.people_chat_16_filled);
  }

  // Widget get _menuNavIcon {
  //   return const Icon(FluentIcons.line_horizontal_3_20_regular);
  // }

  // Widget get _menuNavIconActive {
  //   return const Icon(FluentIcons.line_horizontal_3_20_filled);
  // }

  void _selectNavOption(int i) {
    tabsRouter.setActiveIndex(i);
  }

  double _getConstraintsHeight(bool isSmallScreen, BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    const double appBarHeight = kToolbarHeight;
    const double bottomNavigationHeight = kBottomNavigationBarHeight;
    final double safeArea = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;

    final double heightToRemove =
        appBarHeight + safeArea + bottomNavigationHeight;

    return deviceHeight - heightToRemove;
  }
}
