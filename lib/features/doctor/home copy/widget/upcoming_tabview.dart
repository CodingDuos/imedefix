import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/home/widget/u_appointment_card.dart';

class UpcomingTabView extends StatelessWidget {
  const UpcomingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: UAppointmentCard(
                cancel: () {},
                reschedule: () {},
              ),
            );
          }),
    );
  }
}
