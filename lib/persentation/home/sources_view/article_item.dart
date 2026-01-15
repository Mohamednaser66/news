import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/core/images_manager.dart';
import 'package:news/domain/entites/article_entity.dart';
import 'package:news/models/articales_model.dart';
import 'package:news/data/models/articles_response/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article,});
 final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _showArticleDetailsBottomSheet(context,article);
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 2,color: Theme.of(context).secondaryHeaderColor)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
                child: article.urlToImage ==null?CircularProgressIndicator():Image.network(article.urlToImage!)),
            SizedBox(height: 10.h,),
            Text(article.title??'',style: Theme.of(context).textTheme.titleMedium,
            maxLines: 3,),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(article.author??'',style: Theme.of(context).textTheme.titleSmall,)),
                Expanded(child: Text(article.publishedAt??'',style: Theme.of(context).textTheme.titleSmall,))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showArticleDetailsBottomSheet(BuildContext context, ArticleEntity article) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context, builder: (context) {

      return Container(
        decoration: BoxDecoration(
          color: ColorsManager.black,
              borderRadius: BorderRadius.circular(8.r)
        ),
        padding: REdgeInsets.all(16),
        margin:  REdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: article.urlToImage ==null?CircularProgressIndicator():Image.network(article.urlToImage!)),
            SizedBox(height: 10.h,),
            Text(article.description??'',style: Theme.of(context).textTheme.titleMedium,
              maxLines: 3,),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(article.author??'',style: Theme.of(context).textTheme.titleSmall,)),
                Expanded(child: Text(article.publishedAt??'',style: Theme.of(context).textTheme.titleSmall,))
              ],
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(
              foregroundColor: ColorsManager.black,
              backgroundColor: ColorsManager.white,
              textStyle: Theme.of(context).textTheme.titleMedium,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              )
            ),


                onPressed: (){
              _lunchUrl(article.url??'');
                }, child: Text('View Full Articel')
            )
          ],
        ),
      );
    },);
  }

  void _lunchUrl(String url) async{
    Uri uri =Uri.parse(url);
    if(await canLaunchUrl(uri)){
     await launchUrl(uri,mode:LaunchMode.externalApplication );
    }
  }
}
