import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  UrlLauncherService._();

  static Future<bool> launchUrlString(String urlString) async {
    try {
      final Uri uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Could not launch $urlString');
        return false;
      }
    } catch (e) {
      debugPrint('Error launching URL ($urlString): $e');
      return false;
    }
  }

  static Future<bool> openEmail(
    String emailAddress, {
    String? subject,
    String? body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        if (subject case final String s) 'subject': s,
        if (body case final String b) 'body': b,
      },
    );
    return await launchUrlString(emailUri.toString());
  }

  static Future<bool> openPhone(String phoneNumber) async {
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri phoneUri = Uri(scheme: 'tel', path: cleanNumber);
    return await launchUrlString(phoneUri.toString());
  }

  static Future<bool> openWhatsApp(
    String phoneNumber, {
    String? message,
  }) async {
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$cleanNumber${message != null ? '?text=${Uri.encodeComponent(message)}' : ''}',
    );
    return await launchUrlString(whatsappUri.toString());
  }
}
