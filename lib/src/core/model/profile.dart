class Profile {
  const Profile({
    required this.name,
    required this.imageTitle,
    this.bigTitle,
    this.littleTitle,
    this.tags,
    required this.distance,
    required this.imageAsset,
  });
  final String name;
  final String distance;
  final String? imageTitle;
  final String? bigTitle;
  final String? littleTitle;
  final List<String>? tags;
  final String imageAsset;
}

List<Profile> profilesList = [
  const Profile(
    imageTitle: '101_Main Profile 01',
    bigTitle: '잭과분홍콩나물',
    littleTitle: '서울·2km 거리에 있음',
    name: '',
    tags: [],
    distance: '10',
    imageAsset: 'assets/images/item1.png',
  ),
  const Profile(
    imageTitle: '102_Main Profile 02',
    bigTitle: '잭과분홍콩나물',
    littleTitle:
        '서로 아껴주고 힘이 되어줄 사람 찾아요\n선릉으로 직장 다니고 있고 여행 좋아해요\n이상한 이야기하시는 분 바로 차단입니다',
    name: '',
    distance: '10',
    tags: [],
    imageAsset: 'assets/images/item2.png',
  ),
  const Profile(
    imageTitle: '103_Main Profile 03',
    bigTitle: '잭과분홍콩나물',
    littleTitle: '',
    name: '',
    tags: [
      '💖 진지한 연애를 찾는 중',
      '🍸 전혀 안 함',
      '🚬 비흡연',
      '💪🏻 매일 1시간 이상',
      '🤝 만나는 걸 좋아함',
      "INFP"
    ],
    distance: '10',
    imageAsset: 'assets/images/item3.png',
  ),
];
