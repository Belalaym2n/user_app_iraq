import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/apiManager/api_manager.dart';
import '../../../../core/apiManager/dio_client.dart';
import '../../../../core/cahsing/app_keys.dart';
import '../../../../core/cahsing/secure_storage.dart';
import '../../../bottomNav/bottom_nav.dart';
import '../../../splash/onBoard/on_board_item.dart';

class AutoLogin extends StatefulWidget {
  const AutoLogin({super.key});

  @override
  State<AutoLogin> createState() => _AutoLoginState();
}

class _AutoLoginState extends State<AutoLogin> {
  bool isLoading = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    final userId = await SecureStorageHelper.read(AppKeys.userId);

    if (userId == null) {
      // مفيش user قبل كده
      setState(() {
        isLoggedIn = false;
        isLoading = false;
      });
      return;
    }

     final res = await ApiService.request(endpoint: "/auth/me");

    if (res is Map && res["success"] == true) {
      // الكوكيز VALID
      setState(() {
        isLoggedIn = true;
        isLoading = false;
      });
    } else {
      // الكوكيز INVALID → logout
      await SecureStorageHelper.clear();
      DioClient.cookieJar?.deleteAll();

      setState(() {
        isLoggedIn = false;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: const Center(child: CupertinoActivityIndicator()),
      );
    }

    return isLoggedIn ? BottomNav() : OnBoard();
  }
}
