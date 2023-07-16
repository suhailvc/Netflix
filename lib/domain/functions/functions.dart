import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/domain/common_model/common_model.dart';
import 'package:netflix/domain/common_model/result.dart';

Future<List<Result>> moviesList(String movieUrl) async {
  final responseKey = await http.get(Uri.parse(movieUrl));
  if (responseKey.statusCode == 200) {
    final jsonData = jsonDecode(responseKey.body);
    final result = CommonModel.fromJson(jsonData);
    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}

Future<List<Result>> topTenList() async {
  final responseKey = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/tv/popular?api_key=d14b2be3a7c3086b86928c0671f6414c'));
  if (responseKey.statusCode == 200) {
    final jsonData = jsonDecode(responseKey.body);
    final resultData = CommonModel.fromJson(jsonData);
    if (resultData.results != null) {
      return resultData.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}

Future<List<dynamic>> getimageSearchGrid(String search) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?api_key=d14b2be3a7c3086b86928c0671f6414c&query=${search}'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = CommonModel.fromJson(jsondata);
    if (result.results != null) {
      return result.results!;
    }
  }

  List<Result> empty = [];
  return empty;
}
