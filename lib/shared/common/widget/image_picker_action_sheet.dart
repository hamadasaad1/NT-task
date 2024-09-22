import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/media/media_service_interface.dart';

class ImagePickerActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(
            'Camera',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onPressed: () => Navigator.of(context).pop(AppImageSource.camera),
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Gallery',
          style: Theme.of(context).textTheme.bodyMedium,
          ),
          onPressed: () => Navigator.of(context).pop(AppImageSource.gallery),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          'Cancel',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
