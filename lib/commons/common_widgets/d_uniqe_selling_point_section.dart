import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_uniqe_selling_text_field.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class DUniqeSellingPointSection extends StatelessWidget {
  DUniqeSellingPointSection({super.key});
  var quailtyController = TextEditingController();
  var fundReturneController = TextEditingController();
  var homeServiceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            uniqueSellingPoints,
            style: getMediumStyle(
                color: MyColors.pharmacytextColor, fontSize: MyFonts.size16),
          ),
          const SizedBox(height: 15),
          DUniqeSellingTextField(
            texfieldHeight: 54.h,
            controller: quailtyController,
            hintText: enterindetails,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: whatsthequalityyouwillbeoffering,
            subTitle: '',
          ),
          const SizedBox(height: 15),
          DUniqeSellingTextField(
            texfieldHeight: 54.h,
            controller: fundReturneController,
            hintText: enterindetails,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: whatsyourfundsreturnpolicy,
            subTitle: '',
          ),
          const SizedBox(height: 15),
          DUniqeSellingTextField(
            texfieldHeight: 54.h,
            controller: homeServiceController,
            hintText: enterindetails,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: doyouProvidehomeservices,
            subTitle: '',
          ),
        ]));
  }
}
