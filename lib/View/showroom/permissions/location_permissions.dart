import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// This widget will serve to inform the user in
/// case the permission has been denied. There is a
/// variable [isPermanent] to indicate whether the
/// permission has been denied forever or not.
class LocationPermissions extends StatelessWidget {
  final bool isPermanent;
  final VoidCallback onPressed;

  const LocationPermissions({
    Key? key,
    required this.isPermanent,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 24.0,
              right: 16.0,
            ),
            child: Text(
              'Location permission',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 24.0,
              right: 16.0,
            ),
            child: const Text(
              'We need to request your permission to get '
              'current location and  changes to location periodically to load it in the app.',
              textAlign: TextAlign.center,
            ),
          ),
          if (isPermanent)
            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 24.0,
                right: 16.0,
              ),
              child: const Text(
                'You need to give this permission from the system settings.',
                textAlign: TextAlign.center,
              ),
            ),
          Container(
            padding: const EdgeInsets.only(
                left: 16.0, top: 24.0, right: 16.0, bottom: 24.0),
            child: ElevatedButton(
              // style: ElevatedButton.styleFrom(),
              child: Text(isPermanent ? 'Open settings' : 'Allow access'),
              onPressed: () => isPermanent ? openAppSettings() : onPressed(),
            ),
          ),
        ],
      ),
    );
  }
}
