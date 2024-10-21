import 'package:flutter/material.dart';
import 'notification_manager.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool emailEnabled = false;
  bool smsEnabled = false;
  bool pushEnabled = false;

  @override
  void initState() {
    super.initState();
    loadNotificationSettings();
  }

  void loadNotificationSettings() {
    final manager = NotificationManager();
    setState(() {
      emailEnabled = manager.isEmailEnabled();
      smsEnabled = manager.isSmsEnabled();
      pushEnabled = manager.isPushEnabled();
    });
  }

  void saveNotificationSettings() {
    final manager = NotificationManager();
    manager.saveSettings(emailEnabled: emailEnabled, smsEnabled: smsEnabled, pushEnabled: pushEnabled);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Email Notifications'),
              value: emailEnabled,
              onChanged: (bool value) {
                setState(() {
                  emailEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Enable SMS Notifications'),
              value: smsEnabled,
              onChanged: (bool value) {
                setState(() {
                  smsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Enable Push Notifications'),
              value: pushEnabled,
              onChanged: (bool value) {
                setState(() {
                  pushEnabled = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNotificationSettings,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
