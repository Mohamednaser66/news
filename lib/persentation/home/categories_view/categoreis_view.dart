import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/category_model.dart';
import 'package:news/persentation/home/categories_view/category_item.dart';
import 'package:news/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.good_morning,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 10.h,),
          Expanded(
            child: ListView.separated(
              itemBuilder:
                  (context, index) =>
                      CategoryItem(category: CategoryModel.categories[index]),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
