dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  permission_handler 10.4.3   // Add this package in your pubspec.yaml

----------------- Android Device Permission-------------------
 //Add all the Permissions below package
package="com.example.searchingapp"> //below this line
      
          <!-- Android 12 or below  -->
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

    <!-- Android 13 or greater  -->
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
    <uses-permission android:name="android.permission.READ_MEDIA_VIDEO"/>
    <uses-permission android:name="android.permission.READ_MEDIA_AUDIO"/>

    <uses-permission android:name="android.permission.CAMERA" />
    <uses-feature android:name="android.hardware.Camera"/>
      
------------------- IOS Device Permission---------------------
     // Add all the Permissions in between  </dict> </dict>
      
    <key>NSPhotoLibraryUsageDescription</key>
    <string>photo lib for profile images</string>
    <key>NSCameraUsageDescription</key>
    <string>capture profile photo </string>

      
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerApp extends StatefulWidget {
  const PermissionHandlerApp({super.key});

  @override
  State<PermissionHandlerApp> createState() => _PermissionHandlerAppState();
}

class _PermissionHandlerAppState extends State<PermissionHandlerApp> {
  @override
  Widget build(BuildContext context) {
    final messanger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Permission Handler App',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Camera Permission'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 40)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {
                  PermissionStatus status = await Permission.camera.request();
                  if (status == PermissionStatus.granted) {
                    debugPrint('Permission Granted');
                  }
                  if (status == PermissionStatus.denied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.limited) {
                    debugPrint('Permission is Limited');
                  }
                  if (status == PermissionStatus.restricted) {
                    debugPrint('Permission is Restricted');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Allow us to use Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.permanentlyDenied) {
                    debugPrint('Permission is Permanently Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot use Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                }),
            ElevatedButton.icon(
                icon: const Icon(Icons.image),
                label: const Text('Image Permission'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 40)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.teal),
                ),
                onPressed: () async {
                  PermissionStatus status = await Permission.storage.request();
                  if (status == PermissionStatus.granted) {
                    debugPrint('Permission Granted');
                  }
                  if (status == PermissionStatus.denied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Storage'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.limited) {
                    debugPrint('Permission is Limited');
                  }
                  if (status == PermissionStatus.restricted) {
                    debugPrint('Permission is Restricted');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Allow us to use Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.permanentlyDenied) {
                    debugPrint('Permission is Permanently Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot use Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                }),
            ElevatedButton.icon(
                icon: const Icon(Icons.my_library_add_rounded),
                label: const Text('Multiple Permission'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 40)),
                  //  ww: 200,
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: () async {
                  Map<Permission, PermissionStatus> multiplestatus =
                      await [Permission.camera, Permission.storage].request();
                  if (multiplestatus[Permission.camera]!.isGranted) {
                    debugPrint('Camera Permission is Granted');
                  }
                  if (multiplestatus[Permission.camera]!.isDenied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (multiplestatus[Permission.camera]!.isPermanentlyDenied) {
                    debugPrint('Permission is permanently denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (multiplestatus[Permission.storage]!.isGranted) {
                    debugPrint('Photo Permission is Granted');
                  }
                  if (multiplestatus[Permission.storage]!.isDenied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (multiplestatus[Permission.storage]!.isPermanentlyDenied) {
                    debugPrint('Permission is permanently denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                })
          ],
        ),
      ),
    );
  }
}
