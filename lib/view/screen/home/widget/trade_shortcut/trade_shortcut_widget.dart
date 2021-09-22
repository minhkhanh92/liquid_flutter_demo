import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_demo/liquid.dart';

class TradeShortcutWidget extends StatelessWidget {
  const TradeShortcutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(
          vertical: LDimens.spacing16, horizontal: LDimens.spacing32),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _buildItem(
          context,
          localizations(context).spot,
        ),
        _buildItem(
          context,
          localizations(context).market,
        ),
        _buildItem(
          context,
          localizations(context).infinity,
        ),
        _buildItem(
          context,
          localizations(context).buyAndSwap,
        )
      ]),
    );
  }

  Widget _buildItem(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: SvgPicture.asset(LIcons.liquid,
              width: 16, color: theme.colorScheme.onPrimary),
        ),
        const SizedBox(height: LDimens.spacing8),
        Text(label, style: theme.textTheme.bodyText1?.copyWith(fontSize: 12))
      ],
    );
  }
}
