import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/domain/entities/token_entity.dart';
import 'package:sign_in/src/domain/interactor/sign_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  final ConnectionHelper _connectionHelper;
  SignInCubit({
    required SignInUseCase signInUseCase,
    required ConnectionHelper connectionHelper,
  })  : _signInUseCase = signInUseCase,
        _connectionHelper = connectionHelper,
        super(SignInInitial());

  Future<void> initState() async {
    emit(
      SignInInitial(),
    );
  }

  Future<void> signIn(
    String username,
    String password,
  ) async {
    emit(SignInLoading());

    if (await isNotConnected()) {
      emit(
        SignInConnectionError(),
      );
      return;
    }

    var result = await _signInUseCase.execute(
      username,
      password,
    );
    if (result.hasErrors) {
      emit(
        SignInError(result.errors!),
      );
    } else {
      emit(
        SignInSuccsessful(result.data!),
      );
    }
  }

  Future<bool> isNotConnected() async => !await _connectionHelper.isConnected();
}
