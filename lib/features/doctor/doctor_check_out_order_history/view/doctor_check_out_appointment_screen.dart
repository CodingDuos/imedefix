import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/search_bar.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/widget/d_common_check_out_card.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

import '../../../../commons/common_widgets/d_common_appbar.dart';

class DoctorCheckOutAppointmentScreen extends StatefulWidget {
  const DoctorCheckOutAppointmentScreen({super.key});

  @override
  State<DoctorCheckOutAppointmentScreen> createState() =>
      _DoctorCheckOutAppointmentScreenState();
}

class _DoctorCheckOutAppointmentScreenState
    extends State<DoctorCheckOutAppointmentScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DCommonAppBar(
          appBarTitle: appointment,
          onTap: () {
            Navigator.pop(context);
          }),
      body: SizedBox(
        height: 812.h,
        child: Column(
          children: [
            SearchBars(
              controller: searchController,
              hintText: search,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              sort: () {},
              microphone: () {},
            ),
            SizedBox(
              height: 612.h,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          itemCount: 6,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return DCommonCheckOutCard(
                                isPharmacy: false,
                                orderId: 'hka-48338-71309388',
                                orderDate: 'tue, 21 feb 2023',
                                orderPrice: 479,
                                image: AppAssets.doctorpro,
                                orderTitle: 'Dr. Aahil',
                                orderSubTitle: 'Cardialogist',
                                orderStatus: 'ordered',
                                viewdetail: () {});
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
