import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/record_screen/widget/chat_and_feedbk_card.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chat history',
                style: getBoldStyle(
                    color: MyColors.black, fontSize: MyFonts.size16),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 12.h),
                shrinkWrap: true,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ChatAndFeedBkCard(
                        onTap: () {},
                        text:
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                        image: 'assets/images/img.png'),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
