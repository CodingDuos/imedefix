import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';


class DCommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final VoidCallback onTap;
  const DCommonAppBar({super.key, required this.appBarTitle ,required this.onTap});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20.h,
          color: MyColors.black94,
        ),
      ),
      centerTitle: true,
      title: Text(
        appBarTitle,
        style:
        getSemiBoldStyle(color: MyColors.black94, fontSize: MyFonts.size18),
      ),
    );
  }
}
