import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/user_call_screen.dart/widget/u_call_button_cards.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class UCallButtonSection extends StatelessWidget {
  final Function() videoCall;
  final Function() callCancel;
  final Function() muteCall;

  const UCallButtonSection(
      {super.key,
      required this.videoCall,
      required this.callCancel,
      required this.muteCall});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UCallButtonCard(
          iconColor: MyColors.black,
          color: MyColors.white,
          icon: AppAssets.videoIcon,
          onTap: videoCall,
        ),
        SizedBox(
          width: 20.w,
        ),
        UCallButtonCard(
          iconColor: MyColors.white,
          color: MyColors.red,
          icon: AppAssets.phoneIcon,
          onTap: callCancel,
        ),
        SizedBox(
          width: 20.w,
        ),
        UCallButtonCard(
          iconColor: MyColors.black,
          color: MyColors.white,
          icon: AppAssets.mute,
          onTap: muteCall,
        ),
      ],
    );
  }
}
