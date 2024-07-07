// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:ecommerce_store/bloc/authentication/auth_event.dart';
import 'package:ecommerce_store/bloc/authentication/auth_state.dart';
import 'package:ecommerce_store/data/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository ;
  AuthBloc(
    this._repository,
  ) : super(AuthInitiateState() as AuthState) {
    on<AuthLoginRequest>(((event, emit) async {
      emit(AuthLoadingState());
      var response = await _repository.login(event.username, event.password);
      emit(AuthResponseState(response));
    }));
  }
}
