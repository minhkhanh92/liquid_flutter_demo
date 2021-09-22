import 'package:flutter/material.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/screen/setting/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseState<SettingsModel, SettingsScreen>
    with BaseAutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(title: localizations(context).settings),
      body: super.build(context),
    );
  }

  @override
  Widget buildContentView(BuildContext context, SettingsModel model) {
    final theme = Theme.of(context);
    return ListView(
        padding: const EdgeInsets.symmetric(vertical: LDimens.spacing16),
        children: [
          ListTile(
              title: Text(localizations(context).theme),
              trailing: Text(model.theme.name(context),
                  style: theme.textTheme.bodyText1?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6))),
              tileColor: theme.colorScheme.surface,
              onTap: () => model.changeTheme()),
          Divider(height: 0),
          ListTile(
              title: Text(localizations(context).language),
              trailing: Text(localizations(context).languageName,
                  style: theme.textTheme.bodyText1?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6))),
              tileColor: theme.colorScheme.surface,
              onTap: () => model.changeLanguage())
        ]);
  }
}
