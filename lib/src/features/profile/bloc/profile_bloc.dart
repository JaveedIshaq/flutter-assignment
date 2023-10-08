import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luvit/src/features/profile/data/profile_model.dart';
import 'package:luvit/src/features/profile/data/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  ProfilesBloc({required this.repository}) : super(ProfilesInitial()) {
    on<ProfilesEvent>(_onProfilesGetEvent);
  }

  final ProfileRepository repository;

  FutureOr<void> _onProfilesGetEvent(
    ProfilesEvent event,
    Emitter<ProfilesState> emit,
  ) async {
    try {
      // emit Loading State
      emit(ProfilesLoading());
      // call change Data Api
      await repository.requestChangeData();

      // Fetch Profiles Data
      final profilesData = await repository.fetchProfiles();

      // Emit Loaded state with Profile Lis
      emit(ProfilesLoaded(profilesList: profilesData ?? []));
    } on Exception catch (e) {
      // If there is Exception Emit Error State
      emit(ProfilesError(errorMessage: e.toString()));
    }
    return null;
  }
}
