import 'package:dartz/dartz.dart';
import 'package:ecommerce_store/data/dataSource/authentication_datasource.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/util/api_exception.dart';
import 'package:ecommerce_store/util/auth_manager.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);
  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository implements IAuthRepository {
  final IAuthenticationDataSource _dataSource = locator.get();

  //final SharedPreferences _sharedPref = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _dataSource.register(username, password, passwordConfirm);
      return right('you signed up!');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'Unknown Error');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _dataSource.login(username, password);

      if (token.isNotEmpty) {

        AuthManager.saveToken(token);

        return right('you logged in!');
      } else {
        return left('Unknown Error');
      }
    } on ApiException catch (ex) {
      return left(ex.message ?? 'Unknown Error');
    }
  }
}
