import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home/widgets/d_appointment_time_chain.dart';
import 'package:idaawee/features/doctor/home/widgets/d_next_appointment_card.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DNextAppointmentSection extends StatelessWidget {
  const DNextAppointmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Next Appointments',
                style: getMediumStyle(
                    color: MyColors.textColor, fontSize: MyFonts.size18),
              ),
              padding20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DAppointmentTimeChain(
                    isFirst: true,
                    time: '8:30 am',
                    monthAndYear: 'July 19',
                  ),
                  Container(
                    height: 1.h,
                    width: 98.w,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: MyColors.borderColor,
                        borderRadius: BorderRadius.circular(2.r)),
                  ),
                  const DAppointmentTimeChain(
                    isFirst: false,
                    time: '2:00 pm',
                    monthAndYear: 'July 19',
                  ),
                ],
              ),
            ],
          ),
        ),
        padding30,
        SizedBox(
          height: 210.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return DNextAppointmentCard(
                patientImageUrl:
                    'https://th.bing.com/th/id/OIP.kZB0PltXiA2gYFpk-VOBeAHaHa?pid=ImgDet&w=900&h=900&rs=1',
                patientName: 'Jhon Mikala',
                appointmentTime: '10 Pm',
                onCardTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
