import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/source_response.dart';
import '../model/NewsResponse.dart';
class ApiManager{

//https://newsapi.org/v2/top-headlines/sources?apiKey=9ba1b7a2bc7e44d3aca46b89eecb45de
  static Future<SourceResponse> getSources(String categoryId)async{

    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
    {
      'apiKey': '9ba1b7a2bc7e44d3aca46b89eecb45de',
      'category': categoryId
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e){
       throw e ;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(
      {required String sourceId, int pageNumber=1})async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=9ba1b7a2bc7e44d3aca46b89eecb45de
    Uri url = Uri.https(ApiConstants.baseUrl,
      ApiConstants.newsApi,{
      'apiKey' : '9ba1b7a2bc7e44d3aca46b89eecb45de',
      'sources': sourceId,
      'pageSize':'20',
      'page':'$pageNumber'


        }
    );
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

  static Future<NewsResponse> searchNews(String query)async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=9ba1b7a2bc7e44d3aca46b89eecb45de
    Uri url = Uri.https(ApiConstants.baseUrl,
        ApiConstants.newsApi,{
          'apiKey' : '9ba1b7a2bc7e44d3aca46b89eecb45de',
          'q': query
        }
    );
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
}