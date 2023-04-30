import 'package:flutter/material.dart';

import 'package:jumia_clone/core/resources/color_manager.dart';
import 'package:jumia_clone/core/resources/strings_manager.dart';
import 'package:jumia_clone/core/resources/style_manager.dart';
import 'package:jumia_clone/core/resources/value_manager.dart';
import 'package:jumia_clone/products/presentation/widgets/home/categories_sliders.dart';
import 'package:jumia_clone/products/presentation/widgets/home/deals_widget.dart';
import 'package:jumia_clone/products/presentation/widgets/home/offers_slider.dart';
import 'package:jumia_clone/products/presentation/widgets/home/search_bar.dart';
import 'package:jumia_clone/products/presentation/widgets/home/section_title.dart';

import 'home/installments_widget.dart';

class BuildUserHome extends StatelessWidget {
  const BuildUserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SearchBar(),
          Container(
            alignment: Alignment.center,
            height: height(context) * .06,
            width: width(context),
            color: ColorManager.primary,
            child: Text(
              AppStrings.shipping,
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: AppSize.s14),
            ),
          ),
          const OffersSlider(),
          const CategoriesSliders(),
          const SectionTitle(titel: AppStrings.checkInstallments),
          const InstallmentsWidget(),
          const SectionTitle(titel: AppStrings.amazingDeals),
          heightSpace(10),
          const DealsWidget(),
        ],
      ),
    );
  }
}
