import 'package:crimityapp/profile/profile_form.dart';
import 'package:crimityapp/profile/widgets/image_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
//import 'package:login_flutter_app/src/features/core/controllers/profile_controller.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  //final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      return true;
    },
    child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),

          /// -- Future Builder to load cloud data
          child: FutureBuilder(
            //future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  //UserModel user = snapshot.data as UserModel;

                  //Controllers
                  //final email = TextEditingController(text: user.email);
                  //final password = TextEditingController(text: user.password);
                  //final fullName = TextEditingController(text: user.fullName);
                  //final phoneNo = TextEditingController(text: user.phoneNo);

                  return Column(
                    children: [
                      /// -- IMAGE with ICON
                      const ImageWithIcon(),
                      const SizedBox(height: 50),

                      /// -- Form (Get data and pass it to FormScreen)
                      //ProfileFormScreen(fullName: fullName, email: email, phoneNo: phoneNo, password: password, user: user),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    )
    );
  }
}

