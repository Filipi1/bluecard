import 'package:creditcard/models/auth-response.model.dart';
import 'package:creditcard/models/auth.model.dart';
import 'package:creditcard/repositorys/auth.repository.dart';
import 'package:dio/dio.dart';

class AuthController {
  AuthRepository _authRepository;

  AuthController() {
    _authRepository = new AuthRepository();
  }

  Future<AuthResponseModel> signIn(AuthModel authModel) async {
    Response authResult = await _authRepository.signIn(authModel);
    AuthResponseModel model = AuthResponseModel.fromJson(authResult.data);

    // TODO: Armazenar dados do usuario

    return model;
  }
}