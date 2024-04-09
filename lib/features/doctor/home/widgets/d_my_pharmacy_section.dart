import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home/widgets/d_my_pharmacy_product_card.dart';
import 'package:idaawee/utils/constants/app_constants.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../routes/route_manager.dart';

class DMyPharmacySection extends StatelessWidget {
  const DMyPharmacySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Text(
            'My Pharmacy Products',
            style: getMediumStyle(
                color: MyColors.textColor, fontSize: MyFonts.size18),
          ),
        ),
        padding20,
        SizedBox(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 261.h,
                mainAxisSpacing: 10,
                crossAxisSpacing: 2),
            itemBuilder: (BuildContext context, int index) {
              return DMyPharmacyProductCard(
                onEditProductTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.doctorPharmacyOfferScreen);
                },
                productDiscountPrice: '3799',
                productImage: productImagePath,
                productName: 'muscleblaze super gainer xxl, 11 ib chocolate',
                productOrignalPrice: '6449',
                productRatting: 4.5,
                productSaleTag: 'flashsale ',
              );
            },
          ),
        ),
      ],
    );
  }
}
