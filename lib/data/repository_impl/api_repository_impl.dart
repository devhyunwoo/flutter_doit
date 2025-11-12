import 'package:dio/dio.dart';
import 'package:doit_app/data/model/image_response.dart';
import 'package:doit_app/data/repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository {
  final Dio _dio;

  ApiRepositoryImpl(this._dio);

  @override
  Future<ImageResponse> searchImage(String query) async {
    final response = await _dio.get('/v1/search/image/$query');
    return ImageResponse.fromJson(response.data);
  }
}
