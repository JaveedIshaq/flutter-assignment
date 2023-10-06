import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final databaseReference = FirebaseDatabase.instance.ref('data');

  Future<List<dynamic>> readAllData(String dataNode) async {
    DataSnapshot dataSnapshot =
        (await databaseReference.child(dataNode).once()) as DataSnapshot;

    if (dataSnapshot.value != null) {
      Map<String, dynamic>? dataMap =
          dataSnapshot.value as Map<String, dynamic>?;
      List<dynamic> dataList = dataMap!.values.toList();
      return dataList;
    } else {
      // Handle the case when there is no data at the specified node.
      return [];
    }
  }
}
