// AppBar atom with M3 conventions - solid and lucid variants
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// AppBar design variant.
enum AppBarVariant { solid, lucid }

/// An app bar following M3 conventions with solid and lucid variants.
///
/// Implements [PreferredSizeWidget] so it can be used directly as
/// [Scaffold.appBar] without wrapping.
///
/// Use [AppBarVariant.solid] for an opaque surface background and
/// [AppBarVariant.lucid] for a frosted-glass translucent treatment with
/// a rounded bottom edge.
class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DSAppBar({
    required this.title,
    super.key,
    this.leading,
    this.actions,
    this.variant = AppBarVariant.solid,
    this.elevation,
    this.automaticallyImplyLeading = true,
    this.titleSpacing,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final AppBarVariant variant;
  final double? elevation;
  final bool automaticallyImplyLeading;
  final double? titleSpacing;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);
    final double effectiveElevation = elevation ?? 0.0;

    final Widget effectiveLeading = leading ??
        (automaticallyImplyLeading
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: colors.onSurface,
                  size: 20,
                ),
                onPressed: () => Navigator.of(context).maybePop(),
              )
            : const SizedBox.shrink());

    final List<Widget> effectiveActions = actions ?? const <Widget>[];

    final Widget titleWidget = Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
    );

    final Color backgroundColor = variant == AppBarVariant.lucid
        ? colors.surface.withValues(alpha: 0.7)
        : colors.surface;

    final Widget? flexibleSpace = variant == AppBarVariant.lucid
        ? DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surface.withValues(alpha: 0.7),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16.0),
              ),
            ),
          )
        : null;

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: effectiveLeading,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: titleWidget,
      ),
      actions: effectiveActions,
      elevation: effectiveElevation,
      backgroundColor: backgroundColor,
      titleSpacing: titleSpacing ?? 6.0,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(EnumProperty<AppBarVariant>('variant', variant));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(FlagProperty(
      'automaticallyImplyLeading',
      value: automaticallyImplyLeading,
      ifTrue: 'automaticallyImplyLeading',
    ));
    properties.add(DoubleProperty('titleSpacing', titleSpacing));
  }
}
