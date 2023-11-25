import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:provider/provider.dart';
import '../provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'language_button_sheet.dart';


class SettingsTab extends StatelessWidget {
  static const String routeName = 'Settings';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 22),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showLanguageButtonSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: MyTheme.primaryColor,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  void showLanguageButtonSheet(BuildContext context) {
    showModalBottomSheet(
        builder: (context) => LanguageButtonSheet(), context: context);
  }

}