import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/providers/home_provider.dart';
import 'package:news/providers/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeDrawer extends StatelessWidget {
   HomeDrawer({super.key});
  bool isEnglish =true;

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<HomeProvider>(context);
    return Drawer(
      width: 270.w,

      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.news_app,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            height: 166.h,
            color: Theme.of(context).secondaryHeaderColor,

            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    provider.goToCategoriesView();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home_outlined,size: 30,),
                      SizedBox(width: 10.w,),
                      Text(
                        AppLocalizations.of(context)!.go_to_home,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.dark),
                    Switch(value: Provider.of<ConfigProvider>(context,).isDark, onChanged: (value){
                    Provider.of<ConfigProvider>(context,listen: false).changeTheme(value==true?ThemeMode.dark:ThemeMode.light);
                    }),

                  ],
                ),
                SizedBox(height: 24.h,),
                Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                  thickness: 1,
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('English'),
                    Switch(value: Provider.of<ConfigProvider>(context).isEnglish, onChanged: (value){
                      Provider.of<ConfigProvider>(context,listen: false).changeLanguage(value==true?"en":"ar");
                    }),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
