import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/config/const.dart';
import 'package:sample/src/controllers/core_controller.dart';
import 'package:sample/src/views/widgets/global_widgets.dart';

class ReviewPage extends StatelessWidget with GlobalWidgets {
  ReviewPage({Key? key}) : super(key: key);

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
          Const.reviewTransaction,
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
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      controller.username.value.text,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: controller.selectedData.length * 80.0,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.selectedData.length,
                          itemBuilder: (BuildContext context, rampage) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(color: Stain.backround, borderRadius: BorderRadius.circular(11)),
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
                                    title: Text(controller.finalData[rampage]["nama_layanan"], style: const TextStyle(fontWeight: FontWeight.w600)),
                                    subtitle: Row(
                                      children: [
                                        
                                        Text(
                                          "${controller.finalData[rampage]["jumlah"].toString()} ${controller.finalData[rampage]["nama_satuan"]}",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          currencyFormatter.format(controller.finalData[rampage]["harga"] * controller.finalData[rampage]["jumlah"]),
                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0, bottom: 2.0),
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
                                  color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                  const Text("Tanggal Pembuatan", style: TextStyle(fontSize: 12)),
                                  Text(DateFormat.yMMMd(Localizations.maybeLocaleOf(context)?.toLanguageTag()).format(controller.firstDate.value),
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
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                  const Text("Tanggal Selesai", style: TextStyle(fontSize: 12)),
                                  Text(DateFormat.yMMMd(Localizations.maybeLocaleOf(context)?.toLanguageTag()).format(controller.secondDate.value),
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
                                  color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                  const Text("Keterangan", style: TextStyle(fontSize: 12)),
                                  Text(controller.keterangan.value.text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                child: Wrap(spacing: 5, direction: Axis.vertical, children: [
                                  const Text("Total Tagihan", style: TextStyle(fontSize: 12)),
                                  Text(currencyFormatter.format(controller.allTotal.value),
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
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 45,
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () => controller.firebaseSaveReguest(),
                              style: buttonStyle(color: Stain.buttonSecondari),
                              child: const Text("Simpan Transaksi")),
                        )),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
