import 'dart:developer';

import 'package:doctor_module/model/type3_4model.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApproveAndRecallType_3_4Service {
  Future getapprovedResultService({params}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = params;
      log("service0");
      print("Service log :: " + params);

      var response = await http.post(
        Uri.parse(Urls.approve_recall_type3_4),
        body: data,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body);
        return type34ModelFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      log("service error :: $e");
      rethrow;
    }
  }
}
