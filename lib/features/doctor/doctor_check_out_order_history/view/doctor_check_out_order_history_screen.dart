import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/widget/d_check_out_order_history_section.dart';

import '../../../../commons/common_widgets/d_common_appbar.dart';

class DoctorCheckOutOrderHistory extends StatelessWidget {
  const DoctorCheckOutOrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DCommonAppBar(
        appBarTitle: checkOrdersHistory,
          onTap: (){
            Navigator.pop(context);
          }
      ),
      body: DCheckOutOrderHistorySection(),
    );
  }
}
