import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/upload_controller.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('UploadPage'),
          TextField(
            controller: controller.inputController,
            maxLines: 10,
            minLines: 8,
          ),
          ElevatedButton(
            onPressed: controller.upload, 
            child: Text('Upload')
          ),
        ],
      ),
    );
  }
}