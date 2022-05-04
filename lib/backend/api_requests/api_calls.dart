import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginCall {
  static Future<ApiCallResponse> call({
    String email = '',
    String password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic auth(dynamic response) => getJsonField(
        response,
        r'''$.authToken''',
      );
}

class SignupCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String email = '',
    String password = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "email":"${email}",
  "password":"${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signup',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'email': email,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TimeinCall {
  static Future<ApiCallResponse> call({
    String picture = '',
    String authToken = '',
  }) {
    final body = '''
{
  "pic_in": "${picture}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'timein',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/TIME_IN',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'picture': picture,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TimerecordCall {
  static Future<ApiCallResponse> call({
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'timerecord',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/Get_Rec',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class CsvsendCall {
  static Future<ApiCallResponse> call({
    String receiver = '',
    String subject = '',
    String body = '',
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'csvsend',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/create_csv',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'receiver': receiver,
        'subject': subject,
        'body': body,
      },
      returnBody: true,
    );
  }
}

class TimeoutCall {
  static Future<ApiCallResponse> call({
    String picture = '',
    String authToken = '',
  }) {
    final body = '''
{
  "img_out": "${picture}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'timeout',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/PEACE_OUT',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'picture': picture,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetnameCall {
  static Future<ApiCallResponse> call({
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getname',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:-uzkTeMl/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}
