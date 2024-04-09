import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../commons/common_widgets/CustomTextFields.dart';
import '../../../../utils/constants/assets_manager.dart';

class UTopSearchWidget extends StatelessWidget {
  const UTopSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Imedifix',
            style: getBoldStyle(
                color: MyColors.textColor, fontSize: MyFonts.size22),
          ),
          padding8,
          CustomTextField(
            validatorFn: (value) {
              // if (value!.isEmpty) {
              //   return 'Please enter your email';
              // }
              // return null;
            },
            leadingIconPath: AppAssets.search,
            trailingIconPath: AppAssets.filter,
            texfieldHeight: 60.h,
            controller: TextEditingController(),
            hintText: 'Search Pateint By Name',
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: '',
            subTitle: '',
          ),
        ],
      ),
    );
  }
}
