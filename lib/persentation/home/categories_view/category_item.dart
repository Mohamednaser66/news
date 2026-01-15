import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../providers/home_provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);

    int index = CategoryModel.categories.indexOf(category);
    bool isEven = index % 2 == 0;
    return InkWell(
      onTap: () {
        provider.goToSourcesView(category);
      },
      child: Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            Positioned(
              left: isEven ? 0.w : null,
              right: isEven ? null : 0.w,
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: isEven ? Radius.circular(16.r):Radius.zero,
                    right: !isEven ? Radius.circular(16.r):Radius.zero
  ),
                  child: Image.asset(
                    category.imagePath,
                    height: 200.h,
                    width: 150.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              left: isEven ? null : 20.w,
              right: isEven ? 20.w : null,
              child: Text(
                category.getCategoryTitle(context, category.id),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
