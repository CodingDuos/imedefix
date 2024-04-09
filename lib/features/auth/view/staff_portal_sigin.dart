import 'package:flutter/cupertino.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';

class StaffPortalSignInScreen extends StatefulWidget {
  const StaffPortalSignInScreen({Key? key}) : super(key: key);

  @override
  State<StaffPortalSignInScreen> createState() =>
      _StaffPortalSignInScreenState();
}

class _StaffPortalSignInScreenState extends State<StaffPortalSignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();
  var passObscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [],
          ),
        ),
      ),
    );
  }
}
