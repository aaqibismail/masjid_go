import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/background_gradient.dart';
import 'package:masjid_go/src/models/asr_jurisdiction/asr_jurisdiction.dart';
import 'package:masjid_go/src/models/calculation_method/calculation_method.dart';
import 'package:masjid_go/src/providers.dart';
import 'package:masjid_go/src/router.gr.dart';

const _settingsTileColor = Color(0xFFBED1D8);
final _borderRadius = BorderRadius.circular(10);
final _settingsTileBorder = RoundedRectangleBorder(borderRadius: _borderRadius);

Text _settingsText(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(fontWeight: FontWeight.bold),
  );
}

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useRecentLocations = ref.watch(
      settingsNotifierProvider.select(
        (value) => value.maybeWhen(
          data: (value) => value.storeLastLocation,
          orElse: () => true,
        ),
      ),
    );

    final asrPreference = ref.watch(
      settingsNotifierProvider.select(
        (value) => value.maybeWhen(
          data: (value) => value.asr,
          orElse: () => AsrJurisdiction.standard,
        ),
      ),
    );

    final calcMethod = ref.watch(
      settingsNotifierProvider.select(
        (value) => value.maybeWhen(
          data: (value) => value.calcMethod,
          orElse: () => CalculationMethod.isna,
        ),
      ),
    );

    return BackgroundGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF152834),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => AutoRouter.of(context).navigate(const Home()),
          ),
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: const Color(0xFFF4CCA8),
                  fontWeight: FontWeight.normal,
                ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          children: [
            _SettingsTile(
              text: "Store recent locations",
              trailing: _SettingsSwitch(
                value: useRecentLocations,
                onChanged: (value) {
                  ref
                      .read(settingsNotifierProvider.notifier)
                      .update(store: value);
                },
              ),
            ),
            const SizedBox(height: 24),
            _SettingsTile(
              text: "Enable notifications",
              trailing: _SettingsSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: _settingsTileColor,
              ),
              child: ExpansionTile(
                maintainState: true,
                title: _settingsText(context, "Asr Preference"),
                children: [
                  const SizedBox(height: 8),
                  for (final asr in AsrJurisdiction.values)
                    CheckboxListTile(
                      title: _settingsText(context, asr.description),
                      value: asrPreference == asr,
                      onChanged: (value) {
                        ref
                            .read(settingsNotifierProvider.notifier)
                            .update(asr: asr);
                      },
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: _settingsTileColor,
              ),
              child: ExpansionTile(
                maintainState: true,
                title: _settingsText(context, "Calculation Method"),
                children: [
                  const SizedBox(height: 8),
                  for (final method in CalculationMethod.values)
                    CheckboxListTile(
                      title: _settingsText(context, method.description),
                      value: method == calcMethod,
                      onChanged: (value) {
                        ref
                            .read(settingsNotifierProvider.notifier)
                            .update(calcMethod: method);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;

  const _SettingsSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: const Color(0xFF4E4E8B),
      trackColor: const Color(0xFFACA6A6),
      value: value,
      onChanged: onChanged,
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String text;
  final Widget? trailing;

  const _SettingsTile({
    Key? key,
    required this.text,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _settingsText(context, text),
      tileColor: _settingsTileColor,
      shape: _settingsTileBorder,
      trailing: trailing,
    );
  }
}
