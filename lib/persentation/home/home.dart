import 'package:flutter/material.dart';
import 'package:news/core/routes_manager.dart';
import 'package:news/persentation/home/home_drawer.dart';
import 'package:news/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider =Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, RoutesManager.search);
        }, icon: Icon(Icons.search))],
      ),
      drawer: HomeDrawer(),
      body:homeProvider.view,
    );
  }
}
