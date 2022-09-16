import 'package:sample/src/models/firebase/firebase_models.dart';
import 'package:sample/src/providers/firebase/firebase.dart';

class FireBaseRepo {
  final fire = FirebaseData();
  List datas = [];

  //save data to firebase repo
  Future<bool> saveDataFirebase(
    String total,
    String username,
    String keterangan,
    String createdDate,
    String latestDate,
    List data,
  ) async {
    return await fire.saveTransactions(total, username, keterangan, createdDate, latestDate, data).then((value) => value ? true : false);
  }

//get firebase data repo
  Future getDataFirebase() async {
    await fire.getTransactions().then((value) => value.forEach((key, value) {
          GetDataFirebase data = GetDataFirebase(
              username: value["username"],
              total: value["total"],
              keterangan: value["keterangan"],
              createdDate: DateTime.fromMicrosecondsSinceEpoch(int.parse(value['createdDate']) * 1000),
              latestDate: DateTime.fromMicrosecondsSinceEpoch(int.parse(value['latestDate'] ) * 1000),
              data: value["data"] as List);
          datas.add(data);
        }));
    return datas;
  }
}
