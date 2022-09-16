import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/config/const.dart';
import 'package:sample/src/controllers/core_controller.dart';
import 'package:sample/src/routes/routes.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sample/src/views/widgets/global_widgets.dart';

class AddTransactionPage extends StatelessWidget with GlobalWidgets {
  AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoreController>();
    final currencyFormatter = NumberFormat.currency(locale: 'ID', name: 'Rp ');
    return WillPopScope(
      onWillPop: () async {
        controller.selectedData.isNotEmpty ? dialogWidget() : controller.exit.value = true;
        return controller.exit.value ? true : false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Stain.none,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: const Text(
            Const.addTransaction,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Stain.topGrad, Stain.bottomGrad],
          )),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextField(
                                keyboardAppearance: Brightness.dark,
                                onChanged: (_) => controller.username.refresh(),
                                enableInteractiveSelection: false,
                                onEditingComplete: () => FocusScope.of(context).unfocus(),
                                controller: controller.username.value,
                                decoration: const InputDecoration(border: InputBorder.none, hintText: Const.addName)),
                          ))),
                ),
                Obx(() => controller.selectedData.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: controller.selectedData.length * 80,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.selectedData.length,
                              itemBuilder: (BuildContext context, rampage) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(color: Stain.backround, borderRadius: BorderRadius.circular(11)),
                                    height: 70,
                                    child: ListTile(
                                      leading: const SizedBox(
                                        height: 70,
                                        width: 40,
                                        child: Icon(
                                          Icons.shopify,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      title:
                                          Text(controller.selectedData[rampage]["nama_layanan"], style: const TextStyle(fontWeight: FontWeight.w600)),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            "${controller.selectedData[rampage]["jumlah"].toString()} ${controller.selectedData[rampage]["nama_satuan"]}",
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            currencyFormatter
                                                .format(controller.selectedData[rampage]["harga"] * controller.selectedData[rampage]["jumlah"]),
                                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    : const SizedBox()),
                SizedBox(
                    height: 45,
                    width: 200,
                    child: Obx(() => ElevatedButton(
                        onPressed: () =>
                            controller.username.value.text.isEmpty ? null : {FocusScope.of(context).unfocus(), Get.toNamed(GoRoutes.service)},
                        style: buttonStyle(color: controller.username.value.text.isEmpty ? null : Stain.buttonPrimary),
                        child: const Text(Const.choseService)))),
                Obx(() => controller.selectedData.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 155.0,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 1.7),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Stain.backround,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                    height: 70,
                                    child: ListTile(
                                      leading: const SizedBox(
                                        height: 70,
                                        width: 40,
                                        child: Icon(
                                          Icons.calendar_view_week,
                                          color: Stain.icon,
                                        ),
                                      ),
                                      title: const Text(
                                        Const.dateTransaction,
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Obx(() => Text(
                                            DateFormat.yMMMd(Localizations.maybeLocaleOf(context)?.toLanguageTag())
                                                .format(controller.firstDate.value),
                                            style: const TextStyle(fontSize: 12),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0, top: 1.7),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Stain.backround,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    ),
                                    height: 70,
                                    child: ListTile(
                                        leading: const SizedBox(
                                          height: 70,
                                          width: 40,
                                          child: Icon(
                                            Icons.calendar_view_week,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        title: const Text(
                                          'Tanggal Selesai',
                                          style: TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                        subtitle: Obx(() => Text(
                                              DateFormat.yMMMd(Localizations.maybeLocaleOf(context)?.toLanguageTag())
                                                  .format(controller.secondDate.value),
                                              style: const TextStyle(fontSize: 12),
                                            ))),
                                  ),
                                )
                              ],
                            )),
                      )
                    : const SizedBox()),
                SizedBox(
                    height: 45,
                    width: 200,
                    child: Obx(() => Visibility(
                          visible: controller.selectedData.isNotEmpty ? true : false,
                          child: ElevatedButton(
                              onPressed: () => controller.selectedData.isEmpty
                                  ? null
                                  : DatePicker.showDatePicker(context,
                                      theme: const DatePickerTheme(
                                          //containerHeight: 180,
                                          headerColor: Colors.white,
                                          backgroundColor: Stain.backround,
                                          itemStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
                                          doneStyle: TextStyle(color: Colors.black, fontSize: 16)),
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(2030, 6, 7),
                                      onConfirm: (rampage) => controller.totalDuration(context, rampage),
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.id),
                              style: buttonStyle(color: controller.username.value.text.isEmpty ? null : Stain.buttonPrimary),
                              child: const Text(Const.selectDateTransaction)),
                        ))),
                Obx(() => Visibility(
                      visible: controller.selectedData.isNotEmpty ? true : false,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextField(
                                            keyboardAppearance: Brightness.dark,
                                            onChanged: (_) => controller.username.refresh(),
                                            enableInteractiveSelection: false,
                                            autofocus: false,
                                            onEditingComplete: () => FocusScope.of(context).unfocus(),
                                            controller: controller.keterangan.value,
                                            decoration: const InputDecoration(border: InputBorder.none, hintText: Const.etc)),
                                      ))),
                            ),
                          )),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 45,
                          width: 150,
                          child: Obx(() => Visibility(
                                visible: controller.selectedData.isNotEmpty ? true : false,
                                child: Obx(
                                  () => ElevatedButton(
                                      onPressed: () => controller.username.value.text.isEmpty
                                          ? null
                                          : {FocusScope.of(context).unfocus(), Get.toNamed(GoRoutes.review)},
                                      style: buttonStyle(color: controller.username.value.text.isEmpty ? null : Stain.buttonSecondari),
                                      child: const Text(Const.next)),
                                ),
                              )),
                        ))),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
