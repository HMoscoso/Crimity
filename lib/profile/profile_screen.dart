import 'package:crimityapp/profile/update_profile_screen.dart';
import 'package:crimityapp/profile/widgets/image_with_icon.dart';
import 'package:crimityapp/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
//import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../constants/text_strings.dart';
import '../constants/sizes.dart';
import 'all_users.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return WillPopScope(
        onWillPop: () async {
      return true;
    },
    child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(LineAwesomeIcons.angle_left)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [

              /// -- IMAGE with ICON
              const ImageWithIcon(),
              const SizedBox(height: 10),
              Text("Andre Diaz", style: Theme.of(context).textTheme.headlineMedium),
              Text("andrew_programador@hotmail.com", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Configuracion", icon: LineAwesomeIcons.cog, onPress: () {}),
              //ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () => Get.to(AllUsers())),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {},//=> AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    )
    );

  }
}
