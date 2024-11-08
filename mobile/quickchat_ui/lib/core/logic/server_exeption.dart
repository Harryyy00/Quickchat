import 'package:dio/dio.dart';
import 'package:quickchat_ui/core/logic/error_messages.dart';

class ServerException implements Exception {
  ServerException(this.message);

  final String message;
}

ServerException checkErrResponse(Response<dynamic>? res) {
  late String result;

  if (res != null && res.data != null) {
    final dynamic data = res.data;

    if (data['errors'] != null) {
      // Extracting error message from standard error response
      final String errorMessage = data['errors']['errorMessage'];
      return ServerException(errorMessage);
    }
  }

  // Handling cases where there's no specific error message
  switch (res?.statusCode) {
    case 401:
      result = ERR_401;
      break;
    case 400:
      result = ERR_400;
      break;
    case 403:
      result = ERR_403;
      break;
    case 404:
      result = ERR_404;
      break;
    case 500:
      result = ERR_500;
      break;
    case 503:
      result = ERR_503;
      break;
    case 422:
      result = ERR_422;
      break;
    case 502:
      result = ERR_502;
      break;
    default:
      result = getErrorMessage(res);
  }

  return ServerException(result);
}

String getErrorMessage(Response<dynamic>? res) {
  String result = ERR_DEFAULT;

  if (res != null && res.data != null) {
    final dynamic data = res.data;

    if (data['errors'] != null) {
      result = data['errors']['errorMessage'];
    }
  }

  return result;
}
