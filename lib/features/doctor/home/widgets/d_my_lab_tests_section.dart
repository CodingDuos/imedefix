import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home/widgets/d_my_lab_test_card.dart';
import 'package:idaawee/utils/constants/app_constants.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../routes/route_manager.dart';

class MyLabTestsSection extends StatelessWidget {
  const MyLabTestsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Text(
            'My Lab Test Offerings',
            style: getMediumStyle(
                color: MyColors.textColor, fontSize: MyFonts.size18),
          ),
        ),
        padding20,
        SizedBox(
          height: 210.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return DMyLabTestCard(
                onCardTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.doctorLabTestOfferScreen);
                },
                doctorImage: doctorImage,
                doctorName: 'Dr.Pawan',
                doctorOccupation: 'Consultant',
                doctorSeniority: 'Expert',
                labCategories: const [
                  'Crona',
                  'Santna',
                  'Heigne',
                ],
                labLocation: 'nagod, satna',
                labName: 'Loram Ipsem Lab ',
              );
            },
          ),
        ),
      ],
    );
  }
}
