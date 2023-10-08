import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String name;
  final int age;
  final String? description;
  final String? location;
  final List<String> tags;
  final List<String> images;
  final int likeCount;

  const ProfileModel({
    required this.name,
    required this.age,
    this.description,
    this.location,
    this.tags = const [],
    required this.images,
    required this.likeCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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

  @override
  List<Object?> get props => [
        name,
        age,
        description,
        location,
        tags,
        images,
        likeCount,
      ];
}

// Data for 101_Main_Profile_01


List<ProfileModel> localProfilesList = [
  const ProfileModel(
    name: '잭과분홍콩나물',
    age: 25,
    description: '',
    location: '서울·2km 거리에 있음',
    tags: [],
    images: [
      'assets/images/101_Main_Profile_01.png',
      'assets/images/102_Main_Profile_02.png',
      'assets/images/103_Main_Profile_03.png',
    ],
    likeCount: 29930,
  ),
  const ProfileModel(
    name: '잭과분홍콩나물',
    age: 25,
    description:
        '서로 아껴주고 힘이 되어줄 사람 찾아요\n선릉으로 직장 다니고 있고 여행 좋아해요\n이상한 이야기하시는 분 바로 차단입니다',
    location: '',
    tags: [],
    images: [
      'assets/images/101_Main_Profile_01.png',
      'assets/images/102_Main_Profile_02.png',
      'assets/images/103_Main_Profile_03.png',
    ],
    likeCount: 29930,
  ),
  const ProfileModel(
    name: '잭과분홍콩나물',
    age: 25,
    description: '',
    location: '',
    tags: [
      '💖 진지한 연애를 찾는 중',
      '🍸 전혀 안 함',
      '🚬 비흡연',
      '💪🏻 매일 1시간 이상',
      '🤝 만나는 걸 좋아함',
      "INFP"
    ],
    images: [
      'assets/images/101_Main_Profile_01.png',
      'assets/images/102_Main_Profile_02.png',
      'assets/images/103_Main_Profile_03.png',
    ],
    likeCount: 29930,
  ),
];
