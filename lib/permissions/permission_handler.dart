import 'package:permission_handler/permission_handler.dart';

class PermissionsRequester {
  /// طلب صلاحية الكاميرا
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else {
      final result = await Permission.camera.request();
      return result.isGranted;
    }
  }

  /// طلب صلاحية قراءة التخزين
  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else {
      final result = await Permission.storage.request();
      return result.isGranted;
    }
  }

  /// طلب الصلاحيتين معًا
  static Future<bool> requestCameraAndStoragePermissions() async {
    final cameraGranted = await requestCameraPermission();
    final storageGranted = await requestStoragePermission();
    return cameraGranted && storageGranted;
  }
}
