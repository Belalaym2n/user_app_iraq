import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/main_wrapper.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/features/splash/chooseLanguage/choose_language.dart';

import '../../../../core/apiManager/api_manager.dart';
import '../../../../core/apiManager/dio_client.dart';
import '../../../../core/cahsing/app_keys.dart';
import '../../../../core/cahsing/get_storage_helper.dart';
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
  bool  langSelected= false;

  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    final userId = await SecureStorageHelper.read(AppKeys.userId);
    final lang = await GetStorageHelper.read("lang");
print(" user $userId lang $lang");

    print("lang $lang $langSelected");
    if(lang==null){
      setState(() {
        langSelected = true;
      });

    }
    if (userId == null) {
      // مفيش user قبل كده
      setState(() {
        isLoggedIn = false;
        isLoading = false;
      });
      return;
    }

    print("lang $lang $langSelected");


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
    return MainWrapper(childWidget:

       isLoading?
       Scaffold(
        backgroundColor: Colors.white,
        body: const Center(child:
        CupertinoActivityIndicator(color: AppColors.primaryColor,)),
      ):  langSelected==true?
           ChooseLanguage():


       isLoggedIn ? BottomNav() : OnBoard());
    }





}
