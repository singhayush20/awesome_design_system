import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:awesome_design_system_atoms/atoms.dart';
import 'app_bar_enums.dart';

/// An app bar following Material 3 conventions with solid and lucid frosted-glass variants.
class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DSAppBar({
    required this.title,
    super.key,
    this.leading,
    this.actions,
    this.variant = AppBarVariant.solid,
    this.elevation,
    this.backButtonRequired = false,
    this.onBackPressed,
    this.titleSpacing,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final AppBarVariant variant;
  final double? elevation;
  final bool backButtonRequired;
  final VoidCallback? onBackPressed;
  final double? titleSpacing;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;
    final double effectiveElevation = elevation ?? 0.0;

    final Widget? effectiveLeading =
        leading ??
        (backButtonRequired
            ? DSIconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                onPressed:
                    onBackPressed ?? () => Navigator.of(context).maybePop(),
              )
            : null);

    final List<Widget> effectiveActions = actions ?? const <Widget>[];

    final Widget titleWidget = DSText(title, variant: TextVariant.titleLarge);

    final Color backgroundColor = variant == AppBarVariant.lucid
        ? colors.surface.withValues(alpha: 0.7)
        : colors.surface;

    final Widget? flexibleSpace = variant == AppBarVariant.lucid
        ? DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surface.withValues(alpha: 0.7),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(radius.lg),
              ),
            ),
          )
        : null;

    return AppBar(
      leading: effectiveLeading,
      title: Padding(
        padding: EdgeInsets.only(
          left: effectiveLeading == null ? 0.0 : spacing.sm,
        ),
        child: titleWidget,
      ),
      actions: effectiveActions,
      elevation: effectiveElevation,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      forceMaterialTransparency: variant == AppBarVariant.lucid,
      titleSpacing: titleSpacing ?? spacing.xs,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(EnumProperty<AppBarVariant>('variant', variant));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onBackPressed', onBackPressed),
    );
    properties.add(
      FlagProperty(
        'backButtonRequired',
        value: backButtonRequired,
        ifTrue: 'backButtonRequired',
      ),
    );
    properties.add(DoubleProperty('titleSpacing', titleSpacing));
  }
}
