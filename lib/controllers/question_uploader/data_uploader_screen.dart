import 'package:appkwiz/controllers/question_uploader/data_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploderScreen extends StatelessWidget {
  const DataUploderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataUploader uploader = Get.put(DataUploader()); // Dependency Injection
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Upload Data"),
        ),
      ),
    );
  }
}
