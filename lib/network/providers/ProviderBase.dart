import 'package:covid19_app/network/helper/DioClient.dart';
import 'package:dio/dio.dart';

abstract class ProviderBase {
  DioClient _dioClient = DioClient();


  Dio get dio {
    return _dioClient.dio;
  }
}
