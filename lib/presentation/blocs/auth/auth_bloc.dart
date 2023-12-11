// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/data/services/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, state) async {
      emit(AuthLoading());

      try {
        await userRepository.login(
            email: event.email, password: event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError());
      }
    });

    on<RegisterEvent>((event, state) async {
      if (event.age < 13) {
        emit(AuthError());
        return;
      }
      emit(AuthLoading());

      try {
        await userRepository.register(
          email: event.email,
          password: event.password,
          name: event.name,
          age: event.age,
        );
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError());
      }
    });

    on<LogOutEvent>((event, emit) async {
      await userRepository.logout();
      emit(AuthInitial());
    });
  }
}
