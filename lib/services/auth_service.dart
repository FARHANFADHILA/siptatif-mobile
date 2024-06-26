import 'package:dio/dio.dart';
import 'package:siptatif_mobile/configs/dio_client.dart';

class AuthService {

  final _dio = DioClient.instance;

  Future<Response> login(Map<String, dynamic> data) async {
    return await _dio.post(
        "/mobile/login",
        data: data,
    );
  }

  Future<Response> resetPassword(Map<String, dynamic> data) async {
    return await _dio.post(
        "/mobile/koor-ta/kirim-link-lupa-password",
        data: data,
    );
  }

  Future<Response> refreshToken(Map<String, dynamic> data) async {
    return await _dio.post(
        "/mobile/refresh-access-token",
        data: data,
        options: Options(
          validateStatus: (status) {
        return status != null && status <= 500;
      }
        )
    );
  }
}
