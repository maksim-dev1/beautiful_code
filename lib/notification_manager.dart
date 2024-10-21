import 'package:shared_preferences/shared_preferences.dart';

class NotificationManager {
  static const String emailKey = 'email_enabled';
  static const String smsKey = 'sms_enabled';
  static const String pushKey = 'push_enabled';

  Future<void> saveSettings({required bool emailEnabled, required bool smsEnabled, required bool pushEnabled}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(emailKey, emailEnabled);
    await prefs.setBool(smsKey, smsEnabled);
    await prefs.setBool(pushKey, pushEnabled);
  }

  Future<bool> isEmailEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(emailKey) ?? false;
  }

  Future<bool> isSmsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(smsKey) ?? false;
  }

  Future<bool> isPushEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(pushKey) ?? false;
  }
}
