// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../config.dart' as _i804;
import '../core/auth/authentication_iterceptor.dart' as _i157;
import '../core/network/network_info.dart' as _i6;
import '../core/router/segment.dart' as _i139;
import '../core/scale/system_scale.dart' as _i201;
import '../core/sse/quick_chat_sse.dart' as _i249;
import '../core/utils/date_utils.dart' as _i235;
import '../features/authentication/data/bloc/auth_bloc.dart' as _i868;
import '../features/authentication/data/bloc/segment/segment_bloc.dart'
    as _i228;
import '../features/authentication/data/datasources/auth_local_datasource.dart'
    as _i888;
import '../features/authentication/data/datasources/auth_remote_datasource.dart'
    as _i87;
import '../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i781;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i716;
import '../features/authentication/usecase/auto_login.usecase.dart' as _i188;
import '../features/authentication/usecase/connect_server.usecase.dart'
    as _i545;
import '../features/authentication/usecase/get_credentials.usecase.dart'
    as _i424;
import '../features/authentication/usecase/login_user.usecase.dart' as _i259;
import '../features/authentication/usecase/logout_user.usecase.dart' as _i636;
import '../features/authentication/usecase/register_user.usecase.dart' as _i468;
import '../features/authentication/usecase/segment/dispose_segment_listener.dart'
    as _i790;
import '../features/authentication/usecase/segment/listen_segment_stream.dart'
    as _i655;
import '../features/chat/data/bloc/chat_bloc.dart' as _i915;
import '../features/chat/data/datasources/chat_local_datasource.dart' as _i538;
import '../features/chat/data/datasources/chat_remote_datasource.dart' as _i190;
import '../features/chat/data/repositories/chat_repository_impl.dart' as _i330;
import '../features/chat/domain/repositories/chat_repository.dart' as _i394;
import '../features/chat/usecase/ConnectChatStream.usecase.dart' as _i106;
import '../features/chat/usecase/DisposeChatData.usecase.dart' as _i433;
import '../features/chat/usecase/DisposeChatStream.usecase.dart' as _i623;
import '../features/chat/usecase/GetConversation.usecase.dart' as _i33;
import '../features/chat/usecase/GetConversations.usecase.dart' as _i776;
import '../features/chat/usecase/SelecUsername.usecase.dart' as _i452;
import '../features/chat/usecase/SendChat.usecase.dart' as _i603;
import '../features/user/data/bloc/user_bloc.dart' as _i1021;
import '../features/user/data/datasources/user_local_datasource.dart' as _i147;
import '../features/user/data/datasources/user_remote_datasource.dart' as _i481;
import '../features/user/data/repositories/user_repository_impl.dart' as _i272;
import '../features/user/domain/repositories/user_repository.dart' as _i751;
import '../features/user/usecase/GetUser.usecase.dart' as _i35;
import '../features/user/usecase/SearchUser.usecase.dart' as _i679;
import 'di_container.dart' as _i198;

const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dIContainer = _$DIContainer();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => dIContainer.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => dIContainer.flutterSecureStorage);
    gh.lazySingleton<_i361.Dio>(() => dIContainer.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => dIContainer.internetConnectionChecker);
    gh.lazySingleton<_i139.Segment>(() => _i139.SegmentImpl());
    gh.lazySingleton<_i804.Config>(
        () => _i804.ConfigImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i87.AuthRemoteDatasource>(
        () => _i87.AuthRemoteDatasourceImpl(
              dio: gh<_i361.Dio>(),
              config: gh<_i804.Config>(),
            ));
    gh.lazySingleton<_i147.UserLocalDatasource>(
        () => _i147.UserLocalDatasourceImpl());
    gh.lazySingleton<_i201.SystemScale>(() => _i201.SystemScaleImpl());
    gh.lazySingleton<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl(
        connectionChecker: gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i888.AuthLocalDatasource>(
        () => _i888.AuthLocalDatasourceImpl(
              flutterSecureStorage: gh<_i558.FlutterSecureStorage>(),
              sharedPreferences: gh<_i460.SharedPreferences>(),
            ));
    gh.lazySingleton<_i235.QCDateUtils>(() => _i235.QCDateUtilsImpl());
    gh.lazySingleton<_i716.AuthRepository>(
      () => _i781.AuthRepositoryImpl(
        networkInfo: gh<_i6.NetworkInfo>(),
        authRemoteDatasource: gh<_i87.AuthRemoteDatasource>(),
        authLocalDatasource: gh<_i888.AuthLocalDatasource>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i538.ChatLocalDatasource>(() =>
        _i538.ChatLocalDatasourceImpl(
            sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i157.AuthenticationInterceptor>(() =>
        _i157.AuthenticationInterceptor(prefs: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i228.SegmentBloc>(
        () => _i228.SegmentBloc(gh<_i139.Segment>()));
    gh.lazySingleton<_i481.UserRemoteDatasource>(
        () => _i481.PostsRemoteDatasourceImpl(
              dio: gh<_i361.Dio>(),
              config: gh<_i804.Config>(),
            ));
    gh.lazySingleton<_i249.QuickChatSse>(() => _i249.QuickChatSseImpl(
          config: gh<_i804.Config>(),
          dio: gh<_i361.Dio>(),
        ));
    gh.lazySingleton<_i751.UserRepository>(
      () => _i272.UserRepositoryImpl(
        networkInfo: gh<_i6.NetworkInfo>(),
        userRemoteDatasource: gh<_i481.UserRemoteDatasource>(),
        userLocalDatasource: gh<_i147.UserLocalDatasource>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i790.DisposeSegmentListenerUsecase>(() =>
        _i790.DisposeSegmentListenerUsecase(
            segmentBloc: gh<_i228.SegmentBloc>()));
    gh.factory<_i655.ListenSegmentStreamUsecase>(() =>
        _i655.ListenSegmentStreamUsecase(segmentBloc: gh<_i228.SegmentBloc>()));
    gh.lazySingleton<_i190.ChatRemoteDatasource>(
        () => _i190.ChatRemoteDatasourceImpl(
              dio: gh<_i361.Dio>(),
              config: gh<_i804.Config>(),
              quickChatSse: gh<_i249.QuickChatSse>(),
            ));
    gh.lazySingleton<_i868.AuthBloc>(
        () => _i868.AuthBloc(authRepository: gh<_i716.AuthRepository>()));
    gh.lazySingleton<_i1021.UserBloc>(
        () => _i1021.UserBloc(userRepository: gh<_i751.UserRepository>()));
    gh.lazySingleton<_i394.ChatRepository>(
      () => _i330.ChatRepositoryImpl(
        networkInfo: gh<_i6.NetworkInfo>(),
        chatRemoteDatasource: gh<_i190.ChatRemoteDatasource>(),
        chatLocalDatasource: gh<_i538.ChatLocalDatasource>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i35.GetUserUsecase>(
        () => _i35.GetUserUsecase(userBloc: gh<_i1021.UserBloc>()));
    gh.factory<_i679.SearchUserUsecase>(
        () => _i679.SearchUserUsecase(userBloc: gh<_i1021.UserBloc>()));
    gh.factory<_i188.AutoLoginUserUsecase>(
        () => _i188.AutoLoginUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i545.ConnectServerUsecase>(
        () => _i545.ConnectServerUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i424.GetCredentialsUsecase>(
        () => _i424.GetCredentialsUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i259.LoginUserUsecase>(
        () => _i259.LoginUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i636.LogoutUserUsecase>(
        () => _i636.LogoutUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i468.RegisterUserUsecase>(
        () => _i468.RegisterUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.lazySingleton<_i915.ChatsBloc>(() => _i915.ChatsBloc(
          chatRepository: gh<_i394.ChatRepository>(),
          authRepository: gh<_i716.AuthRepository>(),
        ));
    gh.factory<_i106.ConnectChatStreamUsecase>(
        () => _i106.ConnectChatStreamUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    gh.factory<_i433.DisposeChatDataUsecase>(
        () => _i433.DisposeChatDataUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    gh.factory<_i623.DisposeChatStreamUsecase>(
        () => _i623.DisposeChatStreamUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    gh.factory<_i33.GetConversationUsecase>(
        () => _i33.GetConversationUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    gh.factory<_i776.GetConversationsUsecase>(
        () => _i776.GetConversationsUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    gh.factory<_i452.SelectUsernameUsecase>(
        () => _i452.SelectUsernameUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    gh.factory<_i603.SendChatChatUsecase>(
        () => _i603.SendChatChatUsecase(chatBloc: gh<_i915.ChatsBloc>()));
    return this;
  }
}

class _$DIContainer extends _i198.DIContainer {}
