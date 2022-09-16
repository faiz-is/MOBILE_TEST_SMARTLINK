import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/src/models/firebase/firebase_models.dart';

class FirebaseData {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

//save data transaction to firebase
  Future<bool> saveTransactions(
    String total,
    username,
    keterangan,
    createdDate,latestDate,
    List listData,
     
  ) {
    SaveDataFirebase data =
        SaveDataFirebase(username: username, total: total, keterangan: keterangan, createdDate: createdDate, latestDate: latestDate, data: listData);
    return users.add(data.toJson()).then((_) => true).catchError((error) => false);
  }

//get data transaction from firebase
  Future getTransactions() async {
    return users.get().then((QuerySnapshot rampage) => rampage.docs.asMap());
  }
}
