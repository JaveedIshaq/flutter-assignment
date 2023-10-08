import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/src/core/extensions/string_log.dart';
import 'package:luvit/src/features/profile/data/profile_model.dart';
import 'package:luvit/src/features/profile/data/profile_data_service.dart';

class ProfileRepositoryException implements Exception {}

class ProfileRepository {
  ProfileRepository({ProfileDataService? service})
      : _service = service ?? ProfileDataService();
  final ProfileDataService _service;

  DatabaseReference ref = FirebaseDatabase.instance.ref('data');

  Future<bool> requestChangeData() async {
    try {
      return _service.performRequestChangeData();
    } on Exception {
      throw ProfileRepositoryException();
    }
  }

  Future<List<ProfileModel>?> fetchProfiles() async {
    "inside Fetch Profiles".log();

    try {
      // get profiles Data from Firebase Real Time Database
      final snapshot = await ref.get();

      // If Data exists prepare Profile Models Lis and return
      if (snapshot.exists) {
        final data = snapshot.value as Map<Object?, Object?>;
        final profiles = data.entries
            .map((e) => ProfileModel.fromJson(
                Map<String, dynamic>.from(e.value as Map<Object?, Object?>)))
            .toList();

        "${profiles[0]}".log();
        return profiles;
      } else {
        'No data available.'.log();
        return [];
      }
    } catch (error) {
      ('Error fetching profiles: $error').log();
      // or you might throw an exception depending on your use case
      throw Exception('Error Fetching from Firebase');
    }
  }
}
