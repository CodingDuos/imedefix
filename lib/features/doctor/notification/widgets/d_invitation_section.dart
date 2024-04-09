import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/notification/widgets/d_invitation_card.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class DInvitationSection extends StatelessWidget {
  const DInvitationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const DInvitationCard(
                      title: 'Anna  Kowalsky',
                      time: '19 July 2023',
                      image: AppAssets.doctorpro);
                })
          ]),
        ),
      ),
    );
  }
}
