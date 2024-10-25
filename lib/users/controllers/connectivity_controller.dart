import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var connectionType = 0.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectionStatus();
    streamSubscription = connectivity.onConnectivityChanged.listen(
          (ConnectivityResult event) {
        // Handle connectivity change here
      //  print(event);
        updateConnectionStatus(event);
      },
    );
  }

  Future<void> getConnectionStatus() async {
    try {
      var result = await connectivity.checkConnectivity();
      print(result);
      updateConnectionStatus(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void updateConnectionStatus(ConnectivityResult result) {
    // Update your connectionType based on the result if needed
    // Example: connectionType.value = someLogicBasedOnResult(result);

    if (result == ConnectivityResult.none) {
      // Show snackbar when there is no internet connection
      Get.snackbar(
        'No Internet Connection',
        'Please check your internet connection.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

    }
    else
        {
          Get.snackbar(
            'Online',
            'We are back.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
  }

  @override
  void onClose() {
    streamSubscription.cancel(); // Cancel the subscription when the controller is closed
    super.onClose();
  }
}
