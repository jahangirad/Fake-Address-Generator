import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';



class PermissionController extends GetxController{

  Future<void> requestStoragePermission() async {
    // রিড পারমিশন
    var readPermissionStatus = await Permission.storage.request();

    // রাইট পারমিশন (যদি প্রয়োজন হয়)
    var writePermissionStatus = await Permission.manageExternalStorage.request();

    if (readPermissionStatus.isGranted && writePermissionStatus.isGranted) {
      print("Storage Permission Granted");
      // আপনার কোড এখানে লিখুন
    } else {
      print("Storage Permission Denied");
    }
  }
}