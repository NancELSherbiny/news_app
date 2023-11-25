import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/NewsResponse.dart';
import '../my_theme.dart';

class NewsDetailsScreen extends StatelessWidget {
static const String routeName = 'news_details';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??'',
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.primaryColor,
                    )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 20,),
            Text(news.content??'',style:Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 21
            ),),
            SizedBox(height: 12,),
            Text(news.publishedAt??'',
                style:Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.end),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                launchNewsUrl(news.url??'');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('view full article',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
Future<void> launchNewsUrl(String url) async {
    var uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch');
  }
}
}
