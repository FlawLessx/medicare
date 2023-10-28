import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/pages/home/widget/list_products.dart';
import 'package:medicare/pages/home/widget/list_services.dart';
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
  void initState() {
    appContext = context;
    initData();
    super.initState();
  }

  void initData() {
    BlocProvider.of<ProductCubit>(context).categories();
    BlocProvider.of<ServiceCubit>(context).categories();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductCategoryLoaded) {
              BlocProvider.of<ProductCubit>(context).lists(null);
            }
          },
        ),
        BlocListener<ServiceCubit, ServiceState>(
          listener: (context, state) {
            if (state is ServiceCategoryLoaded) {
              BlocProvider.of<ServiceCubit>(context)
                  .lists(state.datas.first.id);
            }
          },
        ),
      ],
      child: RefreshIndicator(
        onRefresh: () async {
          initData();
        },
        child: Scaffold(
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
            cacheExtent: 4000,
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
              Gap(24.h),
              MenuSecondary(
                image: AssetsConstants.search,
                title: tr('home.menu_3_title'),
                subtitle: tr('home.menu_3_description'),
                buttonTitle: tr('home.menu_3_button'),
                onTap: () {},
                imageLeftPosition: true,
              ),
              Gap(24.h),
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
              ),
              Gap(24.h),
              const ListProducts(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  tr('home.choose_health_type'),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              Gap(10.h),
              const ListServices(),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
