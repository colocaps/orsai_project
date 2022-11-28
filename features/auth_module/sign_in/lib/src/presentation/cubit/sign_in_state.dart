part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInConnectionError extends SignInState {}

class SignInSuccsessful extends SignInState {
  final TokenEntity tokenEntity;

  SignInSuccsessful(this.tokenEntity);
  @override
  List<Object> get props => [tokenEntity];
}

class SignInError extends SignInState {
  final List<String> error;

  SignInError(this.error);

  @override
  List<Object> get props => [error];
}

class SignInUnauthorized extends SignInState {
  final String message;

  SignInUnauthorized(this.message);
  @override
  List<Object> get props => [message];
}
