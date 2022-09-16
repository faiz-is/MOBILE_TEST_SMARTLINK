import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/src/config/auth.dart';
import 'package:sample/src/models/responses/api_responses.dart';
import 'package:sample/src/providers/firebase/firebase.dart';
import 'package:sample/src/repositories/firebase_repo.dart';
import 'package:sample/src/repositories/service_repo.dart';

class CoreController extends GetxController with ServiceRepo, AuhtJwt, FireBaseRepo, FirebaseData {
  RxBool onFilter = false.obs, exit = false.obs;
  RxInt allTotal = 0.obs, dateTime = 0.obs;

  Rx<DateTime> firstDate = DateTime.now().obs, secondDate = DateTime.now().obs;
  RxList serviceData = [].obs, selectedData = [].obs, finalData = [].obs, firebaseData = [].obs;
  Rx<TextEditingController> username = TextEditingController().obs,
      search = TextEditingController().obs,
      keterangan = TextEditingController().obs,
      total = TextEditingController().obs;

  @override
  void onInit() async {
    await apiService();
    await gainFirebaseData();
    super.onInit();
  }

//get Selected Data
  void saveSelectedData(Map data, BuildContext context) {
    data["jumlah"] = int.parse(total.value.text);
    total.value.clear();
    selectedData.add(data);
    finalData.add(data);
    selectedData.refresh();
    totalPrice();
    totalDuration(context, firstDate.value);
    Get.close(2);
  }

//get service data from api
  Future<void> apiService() async {
    await getService(encodeJwt("")).then((rampage) => rampage.status ? serviceData.value = rampage.data : null);
  }

//get filtered data from api
  Future<void> filterapiService() async {
    onFilter.value = true;
    final key = encodeJwt(search.value.text);
    await getService(key).then(
        (rampage) => rampage.status ? {serviceData.value = rampage.data, serviceData.refresh(), onFilter.value = false} : onFilter.value = false);
  }

//create object from service data
  ServiceResponses getAllService(int rampage) {
    return ServiceResponses(
        idlayanan: serviceData[rampage]["idlayanan"],
        namalayanan: serviceData[rampage]["nama_layanan"],
        jumlah: serviceData[rampage]["jumlah"],
        harga: serviceData[rampage]["harga"],
        durasi: serviceData[rampage]["durasi_penyelesaian"].toString(),
        namasatuan: serviceData[rampage]["nama_satuan"],
        durasipenyelesaian: serviceData[rampage]["durasi_penyelesaian"]);
  }

//format Time from miliseconds
  String formatTime(String time) {
    int convert = int.parse(time);
    Duration duration = Duration(milliseconds: convert.round());
    return "${duration.inDays} hari ${duration.inHours.remainder(24)} jam/${serviceData[1]["nama_satuan"]}";
  }

//Total price
  void totalPrice() {
    allTotal.value = 0;
    finalData.asMap().forEach((key, value) {
      int totalPrice = value["harga"] * value["jumlah"];
      allTotal.value = allTotal.value + totalPrice;
      int parser = value["durasi_penyelesaian"];
      dateTime.value <= parser ? dateTime.value = parser : null;
    });
  }

  //Duration Counter
  void totalDuration(BuildContext context, DateTime date) {
    firstDate.value = date;
    secondDate.value = firstDate.value.add(Duration(milliseconds: dateTime.value.round()));
    firstDate.refresh();
    secondDate.refresh();
  }

//save transaction data to firebase
  Future<void> firebaseSaveReguest() async {
    await saveDataFirebase(
      allTotal.value.toString(),
      username.value.text,
      keterangan.value.text,
      firstDate.value.millisecondsSinceEpoch.toString(),
      secondDate.value.millisecondsSinceEpoch.toString(),
      selectedData,
    ).then((value) => value
        ? {reactivateController(), Get.snackbar("Succes", 'Data berhasil Disimpan Di Firebase', backgroundColor: Colors.white)}
        : Get.snackbar("Eror", 'Data gagal disimpan di firebase', backgroundColor: Colors.white));
  }

//closed the controller
  void reactivateController() {
    Get.close(2);
    Get.deleteAll().then((_) => Get.lazyPut(() => CoreController()));
  }

//get all transactions data from saved data in firebase
  Future<void> gainFirebaseData() async {
    await getDataFirebase().then((value) => firebaseData.value = value);
    firebaseData.refresh();
  }
}
