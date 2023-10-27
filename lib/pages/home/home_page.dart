import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/pages/home/widget/menu_primary.dart';
import 'package:medicare/pages/home/widget/menu_secondary.dart';
import 'package:medicare/widgets/custom_textformfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu_outlined,
            color: Theme.of(context).primaryColor,
            size: 24.h,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).primaryColor,
              size: 24.h,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
              size: 24.h,
            ),
          )
        ],
      ),
      body: ListView(
        cacheExtent: 3000,
        children: [
          const MenuPrimary(),
          MenuSecondary(
            image: AssetsConstants.drugs,
            title: tr('home.menu_2_title'),
            subtitle: tr('home.menu_2_description'),
            buttonTitle: tr('home.menu_2_button'),
            onTap: () {},
            imageLeftPosition: false,
          ),
          Gap(20.h),
          MenuSecondary(
            image: AssetsConstants.search,
            title: tr('home.menu_3_title'),
            subtitle: tr('home.menu_3_description'),
            buttonTitle: tr('home.menu_3_button'),
            onTap: () {},
            imageLeftPosition: true,
          ),
          Gap(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.tune_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 24.h,
                  ),
                ),
                Gap(20.w),
                Expanded(
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    hint: tr('general.search'),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                      size: 24.h,
                    ),
                    borderRadius: 50.w,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
