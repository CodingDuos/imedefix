import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class DoctorWalletListtile extends StatelessWidget {
  const DoctorWalletListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AppAssets.arrowsent),
      trailing: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyColors.appColor1)),
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            'E-Receipt',
            style: getBoldStyle(color: MyColors.appColor1, fontSize: 13),
          ),
        ),
      ),
      subtitle: Text(
        'Transaction ID # 3789',
        style: getBoldStyle(color: MyColors.grey, fontSize: 12),
      ),
      title: Text(
        '\$100',
        style: getBoldStyle(color: Colors.black, fontSize: 22),
      ),
    );
  }
}
