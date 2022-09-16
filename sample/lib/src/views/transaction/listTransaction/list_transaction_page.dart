import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/controllers/core_controller.dart';
import 'package:sample/src/views/widgets/global_widgets.dart';

class ListTransactionPage extends StatelessWidget with GlobalWidgets {
  ListTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoreController>();
    final currencyFormatter = NumberFormat.currency(locale: 'ID', name: 'Rp ');
    return Scaffold(
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
            'Data Transaksi',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Scaffold(
          backgroundColor: Stain.backround,
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Stain.topGrad, Stain.bottomGrad],
            )),
            child: Obx(
              () => controller.firebaseData.isNotEmpty
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "List data dari Firebase Firestore Storage",
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:
                                    const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                                height: 560,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.firebaseData.length,
                                    itemBuilder: (BuildContext context, rampage) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("TRANSAKSI KE ${rampage + 1}",
                                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                                Text(controller.firebaseData[rampage].username,
                                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                            child: SizedBox(
                                              height: 280,
                                              width: double.maxFinite,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: double.maxFinite,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                                        child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                                          const Text("Tanggal Pembuatan", style: TextStyle(fontSize: 12)),
                                                          Text(
                                                              DateFormat.yMMMd(Localizations.maybeLocaleOf(context)?.toLanguageTag())
                                                                  .format(controller.firebaseData[rampage].createdDate),
                                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                        ]),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: double.maxFinite,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                                        child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                                          const Text("Tanggal Selesai", style: TextStyle(fontSize: 12)),
                                                          Text(
                                                              DateFormat.yMMMd(Localizations.maybeLocaleOf(context)?.toLanguageTag())
                                                                  .format(controller.firebaseData[rampage].latestDate),
                                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                        ]),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: double.maxFinite,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                                        child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                                          const Text("Keterangan", style: TextStyle(fontSize: 12)),
                                                          Text(controller.firebaseData[rampage].keterangan,
                                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                        ]),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: double.maxFinite,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                                        child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                                          const Text("Total Tagihan", style: TextStyle(fontSize: 12)),
                                                          Text(currencyFormatter.format(int.parse(controller.firebaseData[rampage].total)),
                                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                        ]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: SizedBox(
                                                  height: 45,
                                                  width: 150,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        List dataLength = controller.firebaseData[rampage].data;

                                                        showModalBottomSheet(
                                                            isDismissible: false,
                                                            enableDrag: false,
                                                            shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                            ),
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Container(
                                                                  height: 400,
                                                                  width: 400,
                                                                  decoration:
                                                                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                                                                  child: ListView.builder(
                                                                      physics: const BouncingScrollPhysics(),
                                                                      itemCount: dataLength.length,
                                                                      itemBuilder: (BuildContext context, rampage) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets.all(5.0),
                                                                          child: Container(
                                                                            height: 70,
                                                                            width: 400,
                                                                            decoration: BoxDecoration(
                                                                                color: Stain.backround, borderRadius: BorderRadius.circular(11)),
                                                                            child: Center(
                                                                              child: ListTile(
                                                                                leading: const SizedBox(
                                                                                  height: 70,
                                                                                  width: 40,
                                                                                  child: Icon(
                                                                                    Icons.shopify,
                                                                                    color: Colors.blue,
                                                                                  ),
                                                                                ),
                                                                                title: Text(dataLength[rampage]["nama_layanan"],
                                                                                    style: const TextStyle(fontWeight: FontWeight.w600)),
                                                                                subtitle: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${dataLength[rampage]["jumlah"].toString()} ${dataLength[rampage]["nama_satuan"]}",
                                                                                      style: const TextStyle(fontSize: 12),
                                                                                    ),
                                                                                    const SizedBox(width: 5),
                                                                                    Text(
                                                                                      currencyFormatter.format(dataLength[rampage]["harga"] *
                                                                                          dataLength[rampage]["jumlah"]),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      style: buttonStyle(color: Stain.buttonSecondari),
                                                      child: const Text("Show Item")),
                                                )),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                    ),
            ),
          ),
        ));
  }
}
