import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubTrigger {
  static Future<void> runWorkflow(
      String token, Map<String, dynamic> config) async {
    final url = Uri.parse(
        "https://api.github.com/repos/YOURNAME/AK_Premium_Auto_Edit/dispatches");

    await http.post(
      url,
      headers: {
        "Authorization": "token $token",
        "Accept": "application/vnd.github+json",
      },
      body: jsonEncode({
        "event_type": "auto_edit",
        "client_payload": config,
      }),
    );
  }
}
