import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import '../../settings.dart';
import 'welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => WelcomeModel(client),
      child: const WelcomePage(),
    );
  }

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _languageListFocusNode = FocusNode();
  final _languageListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<WelcomeModel>(context, listen: false);
    model.loadLanguages().then((_) {
      final settings = Settings.of(context, listen: false);
      model.selectLocale(settings.locale);

      _selectAndScrollToLanguage(
          model.selectedLanguageIndex, AutoScrollPosition.middle);
    });
  }

  @override
  void dispose() {
    _languageListFocusNode.dispose();
    _languageListScrollController.dispose();
    super.dispose();
  }

  void _selectAndScrollToLanguage(int index, [AutoScrollPosition? position]) {
    if (index == -1) return;

    final model = context.read<WelcomeModel>();
    model.selectedLanguageIndex = index;

    final settings = Settings.of(context, listen: false);
    settings.applyLocale(model.locale(index));

    _languageListFocusNode.requestFocus();
    _languageListScrollController.scrollToIndex(index,
        preferPosition: position, duration: const Duration(milliseconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WelcomeModel>(context);
    final lang = AppLocalizations.of(context);
    final height = MediaQuery.of(context).size.height;
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.welcome),
      ),
      header: Text(lang.welcomeHeader),
      content: FractionallySizedBox(
        child: Row(
          children: [
            Expanded(
              child: KeySearch(
                autofocus: true,
                focusNode: _languageListFocusNode,
                onSearch: (value) {
                  _selectAndScrollToLanguage(model.searchLanguage(value));
                },
                child: YaruBorderContainer(
                  clipBehavior: Clip.antiAlias,
                  child: ListView.builder(
                    controller: _languageListScrollController,
                    itemCount: model.languageCount,
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        index: index,
                        key: ValueKey(index),
                        controller: _languageListScrollController,
                        child: ListTile(
                          title: Text(model.language(index)),
                          selected: index == model.selectedLanguageIndex,
                          onTap: () => _selectAndScrollToLanguage(index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: kContentSpacing),
            Expanded(
              child: SvgPicture.asset(
                'assets/welcome/logo.svg',
                height: height / 2,
              ),
            )
          ],
        ),
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onNext: () {
            final locale = model.locale(model.selectedLanguageIndex);
            model.applyLocale(locale);
            getService<TelemetryService>()
                .addMetric('Language', locale.languageCode);
          },
        ),
      ],
    );
  }
}
