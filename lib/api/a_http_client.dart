import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:unsplash_test_app/base/serializers.dart';
import 'package:unsplash_test_app/models/error_models.dart';

final httpClient = AHttpClient();
final tokenInterceptor = AuthInterceptor();

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future onRequest(RequestOptions options) async {
    options.headers['Authorization'] = 'Client-ID VKNGEmReMJ1HVbNvKCc2XJhqR_U8d33u450lIK05MXg';
    options.contentType = ContentType.json.toString();
    options.headers['Accept'] = 'application/json';
  }
}

class AHttpClient {
  static final _stagingBaseUrl = 'https://api.unsplash.com';

  String get baseUrl => _dio.options.baseUrl;
  set baseUrl(value) {
    _dio.options.baseUrl = value;
  }

  Dio _dio;

  AHttpClient() {
    _dio = Dio(BaseOptions(
      baseUrl: _stagingBaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));

    _dio.interceptors.add(tokenInterceptor);
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    assert(T != dynamic);

    try {
      Response response = await _dio.get(
        path,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse<T>(response);
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Future<BuiltList<T>> getList<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    assert(T != dynamic);

    try {
      Response response = await _dio.get(
        path,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleListResponse<T>(response);
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Future<T> post<T>(
    String path,
    dynamic data, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    assert(T != dynamic);

    if (data is! FormData && data is! String) {
      data = standardSerializers.serializeWith(
          standardSerializers.serializerForType(data.runtimeType), data);
    }

    try {
      Response response = await _dio.post(
        path,
        data: data,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse<T>(response);
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Future<BuiltList<T>> postList<T>(
    String path,
    dynamic data, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    assert(T != dynamic);

    if (data is! FormData && data is! String) {
      data = serializers.serializeWith(
          serializers.serializerForType(data.runtimeType), data);
    }

    try {
      Response response = await _dio.post(
        path,
        data: data,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleListResponse<T>(response);
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Future<T> put<T>(
    String path,
    dynamic data, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    assert(T != dynamic);

    if (data is! FormData && data is! String) {
      data = serializers.serializeWith(
          serializers.serializerForType(data.runtimeType), data);
    }

    try {
      Response response = await _dio.put(
        path,
        data: data,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse<T>(response);
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Future<T> patch<T>(
    String path,
    dynamic data, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    assert(T != dynamic);

    if (data is! FormData && data is! String) {
      data = serializers.serializeWith(
          serializers.serializerForType(data.runtimeType), data);
    }

    try {
      Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse<T>(response);
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Future<void> delete(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    Type errorType = ApiError,
  }) async {
    try {
      await _dio.delete(
        path,
        queryParameters: _filterQueryParameters(queryParameters),
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e, s) {
      throw _handleError(e, s, errorType: errorType);
    }
  }

  Map<String, dynamic> _filterQueryParameters(Map<String, dynamic> params) {
    final filtered = Map<String, dynamic>();
    params?.forEach((k, v) {
      if (v != null) {
        filtered[k] = v;
      }
    });

    if (filtered.isNotEmpty) {
      return filtered;
    } else {
      return null;
    }
  }

  BuiltList<T> _handleListResponse<T>(Response response) {
    if (response.data == null) {
      return BuiltList<T>();
    }
    var rawList = (response.data as List<dynamic>);
    return BuiltList<T>(rawList.map((item) {
      if (T is String) {
        return item;
      } else {
        return standardSerializers.deserializeWith<T>(
            serializers.serializerForType(T), item);
      }
    }).toList());
  }

  T _handleResponse<T>(Response response) {
    if (T is String) {
      return response.data;
    } else if (typeOf<void>() == T) {
      return null;
    }
    return standardSerializers.deserializeWith(
        serializers.serializerForType(T), response.data);
  }

  dynamic _handleError(error, stacktrace, {Type errorType = ApiError}) {
    print(error);
    print(stacktrace);
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          return ServerError(error);
          break;
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          return NetworkError(error);
          break;
        case DioErrorType.CANCEL:
          return CancelError(error);
          break;
        case DioErrorType.DEFAULT:
          if (error.error is SocketException) {
            return NetworkError(error);
          }
          return error;
          break;
        case DioErrorType.RESPONSE:
          return error;
          // try {
          //   final apiError = standardSerializers.deserializeWith(
          //       serializers.serializerForType(errorType), error.response.data);
          //   return apiError;
          // } catch (serializeError) {
          //   print(serializeError);
          //   return error;
          // }
          break;
        default:
          return error;
      }
    }
    return error;
  }
}

class NetworkError implements Exception {
  final RequestOptions request;
  final Response response;
  final DioErrorType type;

  NetworkError(DioError dioError)
      : request = dioError.request,
        response = dioError.response,
        type = dioError.type;
}

class CancelError implements Exception {
  final RequestOptions request;
  final DioErrorType type;

  CancelError(DioError dioError)
      : request = dioError.request,
        type = dioError.type;
}

class ServerError implements Exception {
  final RequestOptions request;
  final DioErrorType type;

  ServerError(DioError dioError)
      : request = dioError.request,
        type = dioError.type;
}

Type typeOf<T>() => T;