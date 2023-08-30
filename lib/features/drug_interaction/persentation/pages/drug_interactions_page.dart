import 'package:drug_interaction_detector/common/resources/request_status.dart';
import 'package:drug_interaction_detector/features/drug_interaction/persentation/controllers/drug_interactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugInteractionsPage extends GetView<DrugInteractionsController> {
  static const routeName = '/drug_interactions';
  const DrugInteractionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        controller.update(['searchDrugByName']);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drug Interaction Checker'), elevation: 0,
          // elevation: 1,
          centerTitle: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Drug Interaction Checker',
                //   style: Theme.of(context).textTheme.headlineSmall,
                // ),
                // const SizedBox(
                //   height: 32,
                // ),
                Text(
                  'Enter a drug name and select the best match from the list of suggestions; repeat the process to add multiple drugs. Check for drug interactions and save your list for future reference.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  focusNode: controller.searchDrugsFocusNode,
                  controller: controller.drugNameTextEditController,
                  onChanged: (value) => controller.onChangeDrugNameInput(value),
                  decoration:
                      const InputDecoration(label: Text('Enter a drug name')),
                ),
                const SizedBox(
                  height: 4,
                ),
                GetBuilder<DrugInteractionsController>(
                  id: 'searchDrugByName',
                  builder: (_) {
                    if (controller.searchDrugsFocusNode.hasFocus) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Material(
                          color: Colors.grey.shade200,
                          child: Container(
                            height: 200,
                            constraints: const BoxConstraints(
                              maxHeight: 200,
                            ),
                            child: (controller.searchDrugRequestStatus.status ==
                                    Status.loading)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  )
                                : ListView.separated(
                                    itemBuilder: (context, index) => ListTile(
                                        onTap: () => controller.onTapDrug(
                                            controller.searchedDrugs[index]),
                                        title: Text(controller
                                            .searchedDrugs[index].name)),
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                          indent: 25,
                                          endIndent: 25,
                                        ),
                                    itemCount: controller.searchedDrugs.length),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                GetBuilder<DrugInteractionsController>(
                  id: 'selected_drugs',
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.selectedDrugs.length,
                          itemBuilder: (context, index) {
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.selectedDrugs[index].name,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.removeSelectedDrug(controller
                                            .selectedDrugs[index].id!);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ))
                                ]);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GetBuilder<DrugInteractionsController>(
                          id: 'get_interactions',
                          builder: (_) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (controller.drugInteractionsRequestStatus
                                            .status ==
                                        Status.loading)
                                    ? const CircularProgressIndicator(
                                        color: Colors.blue,
                                      )
                                    : ElevatedButton(
                                        onPressed:
                                            controller.selectedDrugs.isEmpty
                                                ? null
                                                : () => controller
                                                    .searchDrugInteractions(),
                                        child:
                                            const Text('Check Interactions')),
                                const SizedBox(
                                  height: 32,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.drugInteractions.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Chip(
                                              label: Text(controller
                                                  .drugInteractions[index]
                                                  .interactionType!),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                                '${controller.drugInteractions[index].drug1?.name}'),
                                            Text(
                                                '- ${controller.drugInteractions[index].drug2?.name}'),
                                          ],
                                        ),
                                        Text(
                                          controller.drugInteractions[index]
                                              .interactionDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: Colors.grey.shade700),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        )
                                      ],
                                    );
                                  },
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
