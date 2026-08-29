import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_atoms/atoms.dart';

class DSListTile extends StatelessWidget {
  const DSListTile({
    required this.title,
    super.key,
    this.subtitle,
    this.onTap,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.border,
  });
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? leading, trailing;
  final Color? backgroundColor;
  final Border? border;
  @override
  Widget build(BuildContext context) => Material(
    color: backgroundColor ?? Theme.of(context).colorScheme.surface,
    shape: border == null
        ? null
        : RoundedRectangleBorder(
            side: border!.top,
            borderRadius: BorderRadius.circular(8),
          ),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            if (leading != null) ...[leading!, const SizedBox(width: 12)],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DSText(title),
                  if (subtitle != null)
                    DSText(subtitle!, colorRole: TextColorRole.secondary),
                ],
              ),
            ),
            if (trailing != null) ...<Widget>[
              const SizedBox(width: 12),
              trailing!,
            ],
          ],
        ),
      ),
    ),
  );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder p) {
    super.debugFillProperties(p);
    p.add(StringProperty('title', title));
    p.add(StringProperty('subtitle', subtitle));
    p.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
    p.add(ColorProperty('backgroundColor', backgroundColor));
    p.add(DiagnosticsProperty<Border?>('border', border));
  }
}
