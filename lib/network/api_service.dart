import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  var url =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-11-19&sortBy=publishedAt&apiKey=a02733271c3a4feeb4a640081fa05152";

  getNews() async {
    var response = await http.get(Uri.parse(url));
    var result = json.decode(response.body) as Map<String, dynamic>;
    
    print(result.toString());
    return result['articles'];
  }
}
