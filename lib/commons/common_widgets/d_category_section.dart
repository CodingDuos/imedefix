import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_category_radio.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DCategorySection extends StatefulWidget {
  final List<String> categories;
  const DCategorySection({super.key, required this.categories});

  @override
  State<DCategorySection> createState() => _DCategorySectionState();
}

class _DCategorySectionState extends State<DCategorySection> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, top: 10.h, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: getMediumStyle(
                color: MyColors.pharmacytextColor, fontSize: MyFonts.size16),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: List.generate(widget.categories.length, (index) {
                  return DCategoryRadio(
                      category: widget.categories[index],
                      index: index,
                      selectIndex: selectIndex,
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      });
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
