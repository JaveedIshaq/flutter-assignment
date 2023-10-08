part of 'profile_bloc.dart';

sealed class ProfilesState extends Equatable {
  const ProfilesState();
}

final class ProfilesInitial extends ProfilesState {
  @override
  List<Object> get props => [];
}

class ProfilesLoading extends ProfilesState {
  @override
  List<Object> get props => [];
}

class ProfilesLoaded extends ProfilesState {
  final List<ProfileModel> profilesList;

  const ProfilesLoaded({
    required this.profilesList,
  });

  @override
  List<Object?> get props => [profilesList];
}

class ProfilesError extends ProfilesState {
  final String errorMessage;
  const ProfilesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
