// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class AppGlobalDataController extends GetxController {
  String name;
  int age;
  List<String> memos;
   
  AppGlobalDataController({
    required this.name,
    required this.age,
    required this.memos,
  });
}
