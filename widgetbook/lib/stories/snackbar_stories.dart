import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Variants', type: DSSnackbar)
Widget snackbarVariants(BuildContext context) {
  return const _SnackbarPreview();
}

class _SnackbarPreview extends StatefulWidget {
  const _SnackbarPreview();

  @override
  State<_SnackbarPreview> createState() => _SnackbarPreviewState();
}

class _SnackbarPreviewState extends State<_SnackbarPreview> {
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ScaffoldMessengerState? messenger = _messengerKey.currentState;
      if (messenger == null) return;
      messenger.showSnackBar(
        DSSnackbar(
          content: 'Connection lost',
          actionLabel: 'Retry',
          onActionPressed: () {},
        ).toSnackBar(context),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _messengerKey,
      child: const Scaffold(
        body: Center(
          child: Text('Snackbar shown through ScaffoldMessenger'),
        ),
      ),
    );
  }
}
