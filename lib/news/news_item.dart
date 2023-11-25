import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/news/news_details_screen.dart';
import '../model/NewsResponse.dart';
class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).pushNamed(NewsDetailsScreen.routeName,
          arguments: news),
      child: Container(
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
            SizedBox(height: 8,),
            Text(news.author??'',
            style:Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.start),
            SizedBox(height: 8,),
            Text(news.title??'',
              style:Theme.of(context).textTheme.titleSmall,),
            SizedBox(height: 8,),
            Text(news.publishedAt??'',
              style:Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}
