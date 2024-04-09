import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_select_service_card.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DOfferSelectService extends StatefulWidget {
  const DOfferSelectService({super.key});

  @override
  State<DOfferSelectService> createState() => _DOfferSelectServiceState();
}

class _DOfferSelectServiceState extends State<DOfferSelectService> {
  List<String> title = [
    consultation,
    appointment,
    labtest,
    pharmacy,
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(selectServiceyouprovide,
            style: getSemiBoldStyle(
                color: MyColors.labCardInnerColor, fontSize: MyFonts.size14)),
        const SizedBox(height: 15),
        SizedBox(
          height: 110.5.h,
          child: GridView.builder(
              itemCount: title.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 47.h,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return DOfferSelectServiceCard(
                  title: title[index],
                  index: index,
                  selectedIndex: selectIndex,
                  onTap: () {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                );
              }),
        )
      ],
    );
  }
}
