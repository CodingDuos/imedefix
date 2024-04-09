import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/user_notification/widget/u_system_card.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class USystemNotification extends StatelessWidget {
  const USystemNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 10.h),
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: USystemCard(
              image: index == 0 ? AppAssets.charg : AppAssets.deposit,
            ));
      },
    );
  }
}
