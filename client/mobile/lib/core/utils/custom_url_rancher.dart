

import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {
  CustomUrlLauncher._();
  static Future<void> jumpToLink({
    required String url,
  }) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
            uri,
        );
      } else {
        AppException(title: 'url:$uri is invalid');
      }
    } on Exception catch (e) {
      AppException(title: e.toString());
    }
  }
}

