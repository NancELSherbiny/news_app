import 'package:flutter/material.dart';
import 'package:news_app/home_screen/home_screen.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main(){
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          NewsDetailsScreen.routeName:(context)=> NewsDetailsScreen()
        },
        theme: MyTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
    }

}