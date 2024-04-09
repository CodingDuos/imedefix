import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_available_time_and_remind_you_card.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DOfferInfoRemainYouBefore extends StatefulWidget {
  const DOfferInfoRemainYouBefore({super.key});

  @override
  State<DOfferInfoRemainYouBefore> createState() =>
      _DOfferInfoRemainYouBeforeState();
}

class _DOfferInfoRemainYouBeforeState extends State<DOfferInfoRemainYouBefore> {
  List<String> availableTimeList = [
    '30 Min',
    '45 Min',
    '60 Min',
    '120 Min',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          remindyoubefore,
          style: getSemiBoldStyle(
              fontSize: MyFonts.size14, color: MyColors.labCardInnerColor),
        ),
        padding12,
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: List.generate(availableTimeList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 3.8),
                child: DOfferInfoAvailableTimeAndRemindYouCard(
                    isRemindYou: true,
                    title: availableTimeList[index],
                    isMore: false),
              );
            }),
          ),
        )
      ],
    );
  }
}
