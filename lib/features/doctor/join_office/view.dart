import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';

import '../../../../commons/common_widgets/CustomTextFields.dart';
import '../../../../utils/constants/assets_manager.dart';

class JoinOfficePage extends StatelessWidget {
  const JoinOfficePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        appBarTitle: 'Join Office',
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              CustomTextField(
                leadingIcon: const Icon(Icons.search),
                controller: TextEditingController(),
                hintText: 'Search Office By Name',
                onChanged: (string) {},
                onFieldSubmitted: (string) {},
                obscure: false,
                label: '',
                subTitle: '',
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            padding20,
                            Container(
                              width: 85.w,
                              height: 92,
                              color: Colors.amber,
                              child: Image.asset(
                                'assets/images/home.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  padding10,
                                  Text(
                                    'Office Name',
                                    style: getBoldStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  Text(
                                    'Heart Specialist',
                                    style: getBoldStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  padding20,
                                  Row(
                                    children: [
                                      Text(
                                        'Status:',
                                        style: getBoldStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                      Text(
                                        ' Active',
                                        style: getBoldStyle(
                                            color: MyColors.appColor1,
                                            fontSize: 16),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
