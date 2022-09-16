import 'package:get/get.dart';
import 'package:sample/src/routes/routes.dart';
import 'package:sample/src/views/home/home_page.dart';
import 'package:sample/src/views/review/review_page.dart';
import 'package:sample/src/views/service/service_page.dart';
import 'package:sample/src/views/transaction/addTransaction/add_transaction_page.dart';
import 'package:sample/src/views/transaction/listTransaction/list_transaction_page.dart';

class GoPages {
  static var list = [
    GetPage(name: GoRoutes.home, page: () => const HomePage()),
    GetPage(name: GoRoutes.service, page: () => ServicePage()),
    GetPage(name: GoRoutes.addTransactions, page: () => AddTransactionPage()),
    GetPage(name: GoRoutes.review, page: () => ReviewPage()),
    GetPage(name: GoRoutes.listTransactions, page: () => ListTransactionPage()),
  ];
}
