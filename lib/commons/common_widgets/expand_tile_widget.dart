import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class ExpandTileWidget extends StatefulWidget {
  const ExpandTileWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.subTitle,
    this.initiallyExpanded,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final String desc;
  final bool? initiallyExpanded;
  final IconData icon;

  @override
  State<ExpandTileWidget> createState() => _ExpandTileWidgetState();
}

class _ExpandTileWidgetState extends State<ExpandTileWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: MyColors.lightContainerColor, width: 1.h),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(1.w, 1.h),
        //     blurRadius: 2.r,
        //     color: Colors.black.withOpacity(0.2),
        //   )
        // ],
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        dense: true,
        horizontalTitleGap: 0,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        child: ExpansionTile(
          onExpansionChanged: (val) {
            setState(() {
              isExpanded = val;
            });
          },
          collapsedBackgroundColor: Colors.white,
          initiallyExpanded: widget.initiallyExpanded ?? isExpanded,
          maintainState: true,
          backgroundColor: MyColors.lightContainerColor,
          tilePadding: EdgeInsets.symmetric(horizontal: 8.h),
          iconColor: isExpanded ? Colors.white : MyColors.appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          collapsedIconColor: MyColors.appColor,
          childrenPadding: const EdgeInsets.all(0),
          title: Text(
            widget.title,
            style:
                getMediumStyle(color: MyColors.black, fontSize: MyFonts.size14),
          ),
          subtitle: Text(
            widget.subTitle,
            style: getRegularStyle(
                color: MyColors.searchTextColor, fontSize: MyFonts.size12),
          ),
          trailing: Icon(
            isExpanded ? Icons.close : widget.icon,
            size: 16.h,
            color: isExpanded ? Colors.white : MyColors.black,
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: ListTile(
                title: Text(
                  widget.desc,
                  style: getRegularStyle(
                      color: MyColors.white, fontSize: MyFonts.size10),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
