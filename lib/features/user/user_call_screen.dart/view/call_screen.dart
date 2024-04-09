import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/features/user/user_call_screen.dart/widget/u_call_button_section.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.callbgColor,
        appBar: CommonAppBar(
          appBarTitle: '',
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              padding30,
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(
                    AppAssets.migraine,
                    height: 141.h,
                    width: 144.w,
                  ),
                ),
              ),
              padding15,
              Text(
                'Dr. Pawan',
                style: getSemiBoldStyle(
                    color: MyColors.white, fontSize: MyFonts.size20),
              ),
              padding15,
              Text(
                ringing,
                style: getRegularStyle(
                    color: MyColors.white, fontSize: MyFonts.size16),
              ),
              const Spacer(),
              UCallButtonSection(
                videoCall: () {},
                muteCall: () {},
                callCancel: () {},
              ),
              padding40,
            ],
          ),
        ));
  }
}
