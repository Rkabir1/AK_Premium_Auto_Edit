import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubTrigger {
  static Future<void> runWorkflow(Map<String, dynamic> config) async {
    // Your GitHub Personal Access Token
    const String token = "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";
    
    // URL updated with your username: Rkabir1
    final url = Uri.parse(
      "https://api.github.com/repos/Rkabir1/AK_Premium_Auto_Edit/dispatches",
    );

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/vnd.github+json",
          "X-GitHub-Api-Version": "2022-11-28",
        },
        body: jsonEncode({
          "event_type": "auto_edit",
          "client_payload": config,
        }),
      );

      if (response.statusCode == 204) {
        print("Success: Workflow triggered successfully!");
      } else {
        print("Error: Status ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (e) {
      print("Connection Error: $e");
    }
  }
}
