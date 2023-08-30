import 'package:drug_interaction_detector/features/drug_interaction/persentation/controllers/drug_interactions_controller.dart';
import 'package:drug_interaction_detector/features/drug_interaction/persentation/pages/drug_interactions_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: DrugInteractionsPage.routeName,
        page: () => const DrugInteractionsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<DrugInteractionsController>(
            () => DrugInteractionsController(Get.find(),Get.find()),
          );
        })),
  ];
}
