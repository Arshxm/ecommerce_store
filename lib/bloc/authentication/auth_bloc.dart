import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/bloc/authentication/auth_event.dart';
import 'package:ecommerce_store/bloc/authentication/auth_state.dart';
import 'package:ecommerce_store/data/repository/authentication_repository.dart';
import 'package:ecommerce_store/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiateState() as AuthState) {
    on<AuthLoginRequest>(((event, emit) async {
      emit(AuthLoadingState());
      var response = await _repository.login(event.username, event.password);
      emit(AuthResponseState(response));
    }));
  }
}
