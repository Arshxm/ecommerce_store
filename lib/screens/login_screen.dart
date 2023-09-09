import 'package:ecommerce_store/bloc/authentication/auth_bloc.dart';
import 'package:ecommerce_store/bloc/authentication/auth_event.dart';
import 'package:ecommerce_store/bloc/authentication/auth_state.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameTextController =
      TextEditingController(text: 'arshamrezakhani2');
  final TextEditingController _passwordTextController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.blue,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon_application.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Apple Shop",
                  style: TextStyle(
                      fontSize: 24, fontFamily: 'RB', color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usernameTextController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontFamily: 'RM', fontSize: 18, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: ConstColor.blue, width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordTextController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'RM', fontSize: 18, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: ConstColor.blue, width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: ((context, state) {
                      if (state is AuthInitiateState) {
                        return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              AuthLoginRequest(_usernameTextController.text,
                                  _passwordTextController.text),
                            );
                          },
                          child: const Text("Login"),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontFamily: 'RB',
                              fontSize: 18,
                            ),
                            minimumSize: const Size(200, 48),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                        );
                      }
                      if (state is AuthLoadingState) {
                        return CircularProgressIndicator();
                      }
                      if (state is AuthResponseState) {
                        return state.response
                            .fold((l) => Text(l), (r) => Text(r));
                      }

                      return Text('unknown Error');
                    }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
