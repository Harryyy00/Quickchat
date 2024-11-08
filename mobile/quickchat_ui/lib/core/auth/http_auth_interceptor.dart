// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:injectable/injectable.dart';
// import 'package:quickchat_ui/config.dart';
// import 'package:quickchat_ui/dic/injection.dart';
// import 'package:quickchat_ui/features/authentication/usecase/logout_user.usecase.dart';
// import 'package:quickchat_ui/features/chat/usecase/DisposeChatStream.usecase.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// @lazySingleton
// class HttpAuthenticationInterceptor {
//   HttpAuthenticationInterceptor({required this.prefs});

//   final SharedPreferences prefs;
//   bool isReAuthenticated = false;

//   String getAccessToken() {
//     return prefs.getString(CacheKeys.ACCESS_TOKEN) ?? '';
//   }

//   void handleTokenExpiration() {
//     // getIt<DisposeChatStreamUsecase>().execute();
//     getIt<LogoutUserUsecase>().execute();
//   }
// }

// class AuthenticatedClient extends http.BaseClient {
//   final http.Client client;
//   final HttpAuthenticationInterceptor authInterceptor;

//   AuthenticatedClient({required this.client, required this.authInterceptor});

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     final String token = authInterceptor.getAccessToken();
//     request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
//     request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';

//     final response = await client.send(request);

//     if (response.reasonPhrase == 'Forbidden') {
//       authInterceptor.handleTokenExpiration();
//     }

//     return response;
//   }
// }
