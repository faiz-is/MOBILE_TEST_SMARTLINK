import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/config/const.dart';
import 'package:sample/src/controllers/core_controller.dart';
import 'package:sample/src/models/responses/api_responses.dart';
import 'package:sample/src/views/widgets/global_widgets.dart';

class ServicePage extends StatelessWidget with GlobalWidgets {
  ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoreController>();
    final currencyFormatter = NumberFormat.currency(locale: 'ID', name: 'Rp ');
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Const.listService,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 630,
                width: 370,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                              height: 50,
                              decoration: BoxDecoration(color: Stain.backround, borderRadius: BorderRadius.circular(11)),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                        keyboardAppearance: Brightness.dark,
                                        onChanged: (_) => controller.filterapiService(),
                                        autofocus: false,
                                        onEditingComplete: () => FocusScope.of(context).unfocus(),
                                        controller: controller.search.value,
                                        decoration: const InputDecoration(border: InputBorder.none, hintText: Const.searchService)),
                                  ))),
                          const SizedBox(height: 10),
                          SizedBox(
                              height: 550,
                              child: Obx(
                                () => controller.onFilter.value
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.serviceData.length,
                                        itemBuilder: (BuildContext context, rampage) {
                                          ServiceResponses data = controller.getAllService(rampage);
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                                            child: InkWell(
                                              onTap: (() {
                                                FocusScope.of(context).unfocus();
                                                controller.total.value.clear();
                                                showModalBottomSheet(
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                    ),
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(context).viewInsets,
                                                        child: SizedBox(
                                                          height: 200,
                                                          child: Wrap(
                                                            alignment: WrapAlignment.center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 20),
                                                                child: Text(
                                                                  data.namalayanan,
                                                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                                                                child: Container(
                                                                    height: 45,
                                                                    decoration: BoxDecoration(
                                                                        color: Stain.backround, borderRadius: BorderRadius.circular(11)),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(left: 20),
                                                                        child: Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: TextField(
                                                                              keyboardType: const TextInputType.numberWithOptions(),
                                                                              keyboardAppearance: Brightness.dark,
                                                                              onChanged: (_) => controller.total.refresh(),
                                                                              onTap: () {},
                                                                              controller: controller.total.value,
                                                                              onEditingComplete: () => FocusScope.of(context).unfocus(),
                                                                              decoration: InputDecoration(
                                                                                  border: InputBorder.none, hintText: "Jumlah ${data.namasatuan}")),
                                                                        ))),
                                                              ),
                                                              SizedBox(
                                                                width: 200,
                                                                height: 45,
                                                                child: Obx(() => ElevatedButton(
                                                                      onPressed: () => controller.total.value.text.isEmpty
                                                                          ? null
                                                                          : {controller.saveSelectedData(controller.serviceData[rampage], context)},
                                                                      style: buttonStyle(
                                                                          color: controller.total.value.text.isEmpty ? null : Stain.buttonSecondari),
                                                                      child: const Text(Const.add),
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              }),
                                              child: Container(
                                                  height: 90,
                                                  decoration: BoxDecoration(color: Stain.backround, borderRadius: BorderRadius.circular(10)),
                                                  child: ListTile(
                                                    leading: const SizedBox(
                                                      height: 80,
                                                      width: 40,
                                                      child: Icon(
                                                        Icons.shopify,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                    subtitle: Padding(
                                                      padding: const EdgeInsets.only(bottom: 8.0),
                                                      child: SizedBox(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(data.namalayanan, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Harga ${currencyFormatter.format(data.harga)}",
                                                              style: const TextStyle(fontSize: 12),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Durasi Pengerjaan ${controller.formatTime(data.durasi)}",
                                                              style: const TextStyle(fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          );
                                        }),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
