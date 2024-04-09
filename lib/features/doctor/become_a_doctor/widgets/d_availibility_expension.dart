import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DAvailabilityExpension extends StatefulWidget {
  const DAvailabilityExpension({super.key});

  @override
  State<DAvailabilityExpension> createState() => _DAvailabilityExpensionState();
}

class _DAvailabilityExpensionState extends State<DAvailabilityExpension> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  String title = select;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          areyouavailableimidiately,
          style: getSemiBoldStyle(
              fontSize: MyFonts.size14, color: MyColors.labCardInnerColor),
        ),
        padding12,
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.loginScreenTextColor.withOpacity(0.16),
              ),
              borderRadius: BorderRadius.circular(12.r)),
          child: ExpansionTileCard(
            elevation: 0,
            shadowColor: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            initialPadding: EdgeInsets.zero,
            baseColor: Colors.white,
            key: cardA,
            title: Text(
              title,
              style: getSemiBoldStyle(
                  color: MyColors.accountTypeTextColor,
                  fontSize: MyFonts.size14),
            ),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            title = yes;
                          });
                          cardA.currentState?.collapse();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Text(
                            yes,
                            style: getSemiBoldStyle(
                                color: MyColors.accountTypeTextColor,
                                fontSize: MyFonts.size14),
                          ),
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            title = no;
                          });
                          cardA.currentState?.collapse();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Text(
                            no,
                            style: getSemiBoldStyle(
                                color: MyColors.accountTypeTextColor,
                                fontSize: MyFonts.size14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
