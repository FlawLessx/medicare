import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare/pages/profile/profile_controller.dart';
import 'package:medicare/pages/profile/widget/profile_data.dart';
import 'package:medicare/pages/profile/widget/profile_header.dart';
import 'package:medicare/widgets/footer.dart';
import 'package:medicare/widgets/toggle_switch.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.selectedPage});
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(context, selectedPage),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            cacheExtent: 2000,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleSwitch(
                      datas: [tr('sidebar.my_profile'), tr('sidebar.settings')],
                      selectedIndex: controller.selectedPage.value,
                      onTap: (index) {
                        controller.selectedPage.value = index;
                      },
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              const Stack(
                children: [
                  ProfileData(),
                  ProfileHeader(),
                ],
              ),
              Gap(40.h),
              const Footer(),
            ],
          ),
        );
      },
    );
  }
}
