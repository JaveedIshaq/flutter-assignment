part of 'profile_bloc.dart';

sealed class ProfilesEvent extends Equatable {
  const ProfilesEvent();

  @override
  List<Object> get props => [];
}

class ProfilesGetEvent extends ProfilesEvent {
  const ProfilesGetEvent();

  @override
  List<Object> get props => [];
}
