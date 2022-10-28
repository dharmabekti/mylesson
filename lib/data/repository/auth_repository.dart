import 'package:flutter/foundation.dart';
import 'package:mylesson/core/urls.dart';
import '../model/register_user_request.dart';
import '../model/user_response.dart';

import '../services/dio_client.dart';

abstract class AuthRepository {
  Future<UserData?> getUserByEmail({required String email});

  Future<bool> registerUser({required UserBody userBody});
  Future<bool> updateUser({required UserBody userBody});
}

class AuthRepositoryImpl implements AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl(this.dioClient);

  @override
  Future<UserData?> getUserByEmail({required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.users,
        queryParameters: {"email": email},
      );

      UserResponse res = UserResponse.fromJson(result);
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getUserByEmail: $e, $stackTrace');
      }
      return null;
    }
  }

  @override
  Future<bool> registerUser({required UserBody userBody}) async {
    try {
      await dioClient.post(Urls.userRegister, body: userBody.toMap());
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err registerUser: $e, $stackTrace');
      }
      return false;
    }
  }

  @override
  Future<bool> updateUser({required UserBody userBody}) async {
    try {
      await dioClient.post(Urls.userUpdate, body: userBody.toMap());
      // final result = await dioClient.post(
      //   Urls.userUpdate,
      //   body: {
      //     "user_email": userData.userEmail,
      //     "nama_lengkap": userData.userName,
      //     "nama_sekolah": userData.userAsalSekolah,
      //     "kelas": userData.kelas,
      //     "gender": userData.userGender,
      //     "jenjang": userData.jenjang,
      //     "foto": userData.userFoto,
      //   },
      // );

      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err submitAnswers: $e, $stackTrace');
      }
      return false;
    }
  }
}
