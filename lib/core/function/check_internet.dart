

import 'dart:io';

Future<bool> checkInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    // Log the error for debugging purposes
    // ignore: avoid_print
    print('Error checking internet connection: $e');
  }
  return false; // Return false if there's an error or no internet connection
}
