import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/add_workshop_dialog.dart';
import 'package:cece/core/utils/components/update_collaborator_dialog.dart';
import 'package:cece/data/models/collaborator_model.dart';
 import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_update_project/items/conference_details_item.dart';
 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WorkshopContent extends GetWidget<OrganizerUpdateProjectController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              updateProjectTabs(controller, context, 'Workshop Details'),
              SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 5,
                  dividerThickness: 1.2,
                  dataTextStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Cairo",
                  ),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Topic",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Language",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Presenter Profile",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Start Date",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "End Date",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Hall",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Delete",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  rows: controller.workshopModel.map((element) {
                    CollaboratorModel collaborator = controller.presenters.firstWhere((e) => e.id==element.presenter,orElse: () => CollaboratorModel(),);
                    return DataRow(cells: [
                    DataCell(Text(element.topic??'')),
                    DataCell(Text(element.language??'')),
                    DataCell(Visibility(
                      visible: collaborator.id !=null ,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            Get.dialog(UpdateCollaboratorDialog(collaborator: collaborator));
                          }, icon: Icon(Iconsax.personalcard)),
                          Text('${collaborator.firstName} ${collaborator.lastName}'),
                        ],
                      ),
                    )),
                    DataCell(Text(element.startDate??'')),
                    DataCell(Text(element.endDate??'')),
                    DataCell(Text(element.hall??'')),
                    DataCell(ElevatedButton(onPressed: (){
                      controller.workshopModel.removeWhere((e) => e.id == element.id);
                    }, child: Text('Delete'),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),),),
                  ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.dialog(UpdateWorkshopDialog());
          },
          child: Icon(Icons.add),
        ) ,
      ),
    );
  }
}

/*
*
* */