import 'package:appkwiz/controllers/firebase_ref/loading_status.dart';
import 'package:appkwiz/controllers/question_controller/data_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploderScreen extends StatelessWidget {
  const DataUploderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataUploader controller = Get.put(DataUploader()); // Dependency Injection
    return Scaffold(
      body: Center(
        child: Obx(
          (() => Text(
                controller.loadingStatus.value == LoadingStatus.completed
                    ? "Uploading Completed"
                    : "Uploading...",
              )),
        ),
      ),
    );
  }
}
