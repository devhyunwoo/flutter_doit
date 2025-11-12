import 'package:doit_app/data/model/image_response.dart';

abstract class ApiRepository {
  Future<ImageResponse> searchImage(String query);
}
