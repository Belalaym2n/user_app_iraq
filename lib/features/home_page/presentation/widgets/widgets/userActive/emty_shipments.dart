import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class EmptyShipmentsWidget extends StatelessWidget {

  const EmptyShipmentsWidget({
    Key? key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [


          _build_icon(),

          const SizedBox(height: 20),

          _build_no_active_text(),
            SizedBox(height: 8),
          _build_description()

        ],
      ),
    );
  }

  Widget _build_description(){
    return       Text(
      LocaleKeys.Home_active_shipments_info.tr()
 ,
      style:AppTextStyles.bodyMedium()
      ,
      textAlign: TextAlign.center,
    );
  }
Widget _build_no_active_text(){

  return   Text(
    LocaleKeys.Home_no_active_shipments.tr(),
     style:AppTextStyles.titleMedium(),

    textAlign: TextAlign.center,
  );

}
 Widget _build_icon(){
    return  Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Icon(
        Icons.local_shipping_outlined,
        size: 40,
        color: Colors.blue,
      ),
    );
  }
}
