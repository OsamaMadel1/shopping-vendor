import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionsRequester {
  /// طلب صلاحية الكاميرا
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) return true;
    final result = await Permission.camera.request();
    return result.isGranted;
  }

  /// طلب صلاحية الصور أو التخزين حسب النظام
  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      // Android 13+ يدعم Permission.photos (يتم ترجمته تلقائيًا إلى READ_MEDIA_IMAGES)
      if (await Permission.photos.isGranted) return true;
      final result = await Permission.photos.request();
      return result.isGranted || await Permission.storage.request().then((r) => r.isGranted);
    } else if (Platform.isIOS) {
      final result = await Permission.photos.request();
      return result.isGranted;
    } else {
      return false;
    }
  }

  /// طلب الصلاحيتين معًا
  static Future<bool> requestCameraAndStoragePermissions() async {
    final camera = await requestCameraPermission();
    final storage = await requestStoragePermission();
    return camera && storage;
  }
}
