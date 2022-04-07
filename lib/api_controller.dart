import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_checking_task/UniversityModel.dart';

class ApiController extends ChangeNotifier {
  late List<University> universities;

  List<University> get listOfUniversities => universities;

  void getDatafromApi() async {
    Response response;
    var dio = Dio();
    try {
      response = await dio
          .get('http://universities.hipolabs.com/search?country=United+States');
      List data = response.data.toString().split(',');
      universities = data.map((e) => University.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
