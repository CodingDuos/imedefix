import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home/widgets/d_appointment_card.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/app_constants.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DMyAppointmentSection extends StatelessWidget {
  const DMyAppointmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Text(
            'My Appointments',
            style: getMediumStyle(
                color: MyColors.textColor, fontSize: MyFonts.size18),
          ),
        ),
        padding20,
        SizedBox(
          height: 152.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return DAppointmentCard(
                image: doctorImage,
                description:
                    'Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.',
                name: 'Dr.Pawan',
                rating: 4.5,
                onEditTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.doctorAppointmentOfferScreen);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
