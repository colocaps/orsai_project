import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileSelectionState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileSelectionInitial extends ProfileSelectionState {}

class ProfileSelectionLoading extends ProfileSelectionState {}

class ProfileSelectionConnectionError extends ProfileSelectionState {}

class ProfileSelectionLoaded extends ProfileSelectionState {
  final List<ProfileSelectionEntity> selectionProfileEnityList;

  ProfileSelectionLoaded(this.selectionProfileEnityList);
  @override
  List<Object> get props => [selectionProfileEnityList];
}

class ProfileSelectionError extends ProfileSelectionState {
  final List<String> error;

  ProfileSelectionError(this.error);

  @override
  List<Object> get props => [error];
}
