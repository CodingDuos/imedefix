import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_available_time_and_remind_you_card.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DOfferInfoAvailableTime extends StatefulWidget {
  final List<String> availableTimeList;
  const DOfferInfoAvailableTime({super.key, required this.availableTimeList});

  @override
  State<DOfferInfoAvailableTime> createState() =>
      _DOfferInfoAvailableTimeState();
}

class _DOfferInfoAvailableTimeState extends State<DOfferInfoAvailableTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          availableTime,
          style: getSemiBoldStyle(
              fontSize: MyFonts.size14, color: MyColors.labCardInnerColor),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: List.generate(widget.availableTimeList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 3.8),
                  child: DOfferInfoAvailableTimeAndRemindYouCard(
                      isRemindYou: false,
                      onTap: () {},
                      title: widget.availableTimeList[index],
                      isMore: index == 4 ? true : false),
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}
