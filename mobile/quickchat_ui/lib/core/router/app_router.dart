import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:quickchat_ui/config.dart';
import 'package:quickchat_ui/features/authentication/presentation/pages/Home.page.dart';
import 'package:quickchat_ui/features/authentication/presentation/pages/Initial.page.dart';
import 'package:quickchat_ui/features/authentication/presentation/pages/Login.page.dart';
import 'package:quickchat_ui/features/authentication/presentation/pages/Register.page.dart';
import 'package:quickchat_ui/features/chat/presentation/pages/Chat.page.dart';
import 'package:quickchat_ui/features/user/presentation/pages/Menu.page.dart';
import 'package:quickchat_ui/features/chat/presentation/pages/Chats.page.dart';
import 'package:quickchat_ui/features/user/presentation/pages/Contacts.page.dart';
import 'package:quickchat_ui/features/user/presentation/pages/UserDetails.page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: InitialRoute.page,
          initial: true,
          path: ScreenRoute.INITIAL_ROUTE,
        ),
        CustomRoute(
          page: LoginRoute.page,
          path: ScreenRoute.LOGIN_ROUTE,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          path: ScreenRoute.REGISTER_ROUTE,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: HomeRoute.page,
          path: ScreenRoute.HOME_ROUTE,
          children: <AutoRoute>[
            CustomRoute(
              page: ChatsRoute.page,
              path: ScreenRoute.CHATS_ROUTE,
              transitionsBuilder: TransitionsBuilders.slideBottom,
            ),
            CustomRoute(
              page: ContactsRoute.page,
              path: ScreenRoute.CONTACTS_ROUTE,
              transitionsBuilder: TransitionsBuilders.slideBottom,
            ),
            CustomRoute(
              page: MenuRoute.page,
              path: ScreenRoute.MENU_ROUTE,
              transitionsBuilder: TransitionsBuilders.slideBottom,
            ),
          ],
        ),
        AutoRoute(
          page: ChatRoute.page,
          path: ScreenRoute.CHAT_ROUTE,
        ),
        AutoRoute(
          page: UserDetailsRoute.page,
          path: ScreenRoute.USER_DETAILS_ROUTE,
        ),
      ];
}
