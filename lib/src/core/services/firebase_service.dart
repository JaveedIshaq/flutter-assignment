import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/src/core/extensions/string_log.dart';

class ProfileData {
  final String name;
  final int age;
  final String? description;
  final String? location;
  final List<String> tags;
  final List<String> images;
  final int likeCount;

  ProfileData({
    required this.name,
    required this.age,
    this.description,
    this.location,
    this.tags = const [],
    required this.images,
    required this.likeCount,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      name: json['name'],
      age: json['age'],
      description: json['description'],
      location: json['location'],
      tags: List<String>.from(json['tags']),
      images: List<String>.from(json['images']),
      likeCount: json['likeCount'],
    );
  }

  @override
  String toString() {
    return 'ProfileData{name: $name, age: $age, description: $description, '
        'location: $location, tags: $tags, images: $images, likeCount: $likeCount}';
  }
}

class DatabaseService {
  final databaseReference = FirebaseDatabase.instance.ref('data');

  Future<List<ProfileData>> readAllData() async {
    "inside readAllData".log();

    final snapshot = await databaseReference.get();

    if (snapshot.exists) {
      "inside snapshot.exists".log();

      final data = snapshot.value as Map<Object?, Object?>;

      final profiles = data.entries
          .map((e) => ProfileData.fromJson(
              Map<String, dynamic>.from(e.value as Map<Object?, Object?>)))
          .toList();

      "${profiles[0]}".log();
      return profiles;
    } else {
      'No data available.'.log();

      return [];
    }
  }

  // Future<List<dynamic>> readAllData() async {
  //   "inside readAllData".log();

  //   DataSnapshot dataSnapshot =
  //       (await databaseReference.once()) as DataSnapshot;

  //   if (dataSnapshot.value != null) {
  //     Map<String, dynamic>? dataMap =
  //         dataSnapshot.value as Map<String, dynamic>?;
  //     'dataMap: $dataMap'.log();
  //     List<dynamic> dataList = dataMap!.values.toList();

  //     return dataList;
  //   } else {
  //     // Handle the case when there is no data at the specified node.
  //     return [];
  //   }
  // }
}
