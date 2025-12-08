 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadsTap/tap_item.dart';

class TabControllerItem extends StatefulWidget {
  TabControllerItem({super.key,
    required this.successOrder,
    required this.cancelOrder,
    required this.pendingOrder,
    required this.selectedIndex});
  int selectedIndex ;
  int successOrder;
  int cancelOrder;
  int pendingOrder;

  @override
  State<TabControllerItem> createState() => _TabControllerItemState();
}

class _TabControllerItemState extends State<TabControllerItem> {



  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> statusList = [
      {'label': 'Pending',"count":widget.pendingOrder },
      {'label': 'Success', 'count': widget.successOrder},
      {'label': 'Cancel', 'count': widget.cancelOrder},
    ];
    return DefaultTabController(
      length: statusList.length,
      child: Container(
        margin: EdgeInsets.fromLTRB(
          AppConstants.w * 0.0444, // بدل 16
          AppConstants.h * 0.0,   // بدل 8
          AppConstants.w * 0.0444, // بدل 16
          AppConstants.h * 0.0,   // بدل 16
        ),

        width: AppConstants.w*0.95,
        height: 50,
        child: TabBar(

          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelPadding: const EdgeInsets.only(

              left: 2,),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: (index) {
            // context.read<HistoryOrdersBloc>().add(ChooseStatusEvent(
            //   status: statusList[index]['label'],
            //   index: index,
            // ));
          },
          tabs: List.generate(
            statusList.length,
                (index) {
              final status = statusList[index];
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: OrderStatusWidget(
                  statusName: status['label'],
                  orderCount: status['count'],
                  isSelected: widget.selectedIndex == index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
