import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class ChatConversationScreen extends StatelessWidget {
  const ChatConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.h,
            color: MyColors.black94,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Dr. Pawan',
          style: getSemiBoldStyle(
              color: MyColors.black94, fontSize: MyFonts.size20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
                onTap: () {},
                child: Image.asset(
                  AppAssets.ccall,
                  height: 22.4.h,
                  width: 22.4.w,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
                onTap: () {},
                child: Image.asset(
                  AppAssets.cvideocall,
                  height: 22.4.h,
                  width: 22.4.w,
                )),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90.h,
        width: 1.sw,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 53.h,
                width: 283.w,
                decoration: BoxDecoration(
                    color: MyColors.offerbgColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
                    hintText: 'Type a message',
                    hintStyle: getRegularStyle(
                      color: MyColors.grey,
                      fontSize: MyFonts.size16,
                    ),
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          AppAssets.camera1,
                          height: 17.5.h,
                          width: 17.5.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset(AppAssets.send, height: 45.h, width: 45.w))
            ],
          ),
        ),
      ),
    );
  }
}
