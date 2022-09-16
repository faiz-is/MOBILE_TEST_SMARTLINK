import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/config/const.dart';
import 'package:sample/src/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Stain.topGrad, Stain.bottomGrad])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 400),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: InkWell(
                    onTap: () => Get.toNamed(GoRoutes.addTransactions),
                    child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const ListTile(
                          contentPadding: EdgeInsets.all(20),
                          leading: Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 30),
                            child: Icon(
                              Icons.add_box,
                              color: Stain.buttonPrimary,
                              size: 30,
                            ),
                          ),
                          title: Text(Const.transaction),
                          subtitle: Text(
                            Const.subTransaction,
                            style: TextStyle(fontSize: 12),
                          ),
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () => Get.toNamed(GoRoutes.listTransactions),
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 30),
                          child: Icon(
                            Icons.list_alt,
                            color: Stain.icon,
                            size: 30,
                          ),
                        ),
                        title: Text(Const.listTransaction),
                        subtitle: Text(
                          Const.subListTransaction,
                          style: TextStyle(fontSize: 12),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
