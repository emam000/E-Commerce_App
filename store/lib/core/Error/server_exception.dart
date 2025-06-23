import 'package:store/core/Error/error_model.dart';

//! server Exception ....
class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

//! cache Exception ...

class CacheException implements Exception {
  final String errorMessage;

  CacheException({required this.errorMessage});
}

// //! fucction to handle Dio Exception .... and use it in dio consumer  ...

// void handleDioException(DioException e) {
//   switch (e.type) {
//     case DioExceptionType.connectionTimeout:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));
//     case DioExceptionType.sendTimeout:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));

//     case DioExceptionType.receiveTimeout:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));

//     case DioExceptionType.badCertificate:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));

//     case DioExceptionType.cancel:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));

//     case DioExceptionType.connectionError:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));

//     case DioExceptionType.unknown:
//       throw (ServerException(
//           errorModel: ErrorModel.fromjson(e.response!.data)));

//     case DioExceptionType.badResponse:
//       switch (e.response!.statusCode) {
//         case 400:
//         case 401:
//         case 402:
//         case 403:
//         case 404:
//         case 500:
//           throw (ServerException(
//               errorModel: ErrorModel.fromjson(e.response!.data)));
//         default:
//           throw (ServerException(
//               errorModel: ErrorModel.fromjson(e.response!.data)));
//       }
//   }
// }
