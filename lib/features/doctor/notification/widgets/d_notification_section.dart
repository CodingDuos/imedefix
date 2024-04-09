import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/doctor/notification/widgets/d_notification_card.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DNotificationSection extends StatelessWidget {
  const DNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  today,
                  style: getMediumStyle(
                      color: MyColors.black, fontSize: MyFonts.size18),
                ),
                padding10,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const DNotificationCard(
                        image: AppAssets.doctorpro,
                        title: 'Jessica Month',
                        subTitle: 'New Appointment',
                        time: 'July 20, 11:20-11:50',
                      );
                    }),
                Text(
                  yesterday,
                  style: getMediumStyle(
                      color: MyColors.black, fontSize: MyFonts.size18),
                ),
                padding10,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const DNotificationCard(
                        image: AppAssets.doctorpro,
                        title: 'Jessica Month',
                        subTitle: 'New Appointment',
                        time: 'July 20, 11:20-11:50',
                      );
                    }),
              ]),
        ),
      ),
    );
  }
}
