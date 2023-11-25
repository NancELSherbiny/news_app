import 'package:flutter/material.dart';
import 'package:news_app/category/category.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/my_theme.dart';

class CategoryFragment extends StatelessWidget {
static const String routeName ='categoryFragments';

var categoriesList = Category.getCategory();
Function onCategoryClick;
CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category \nof interest ',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.greyColor),),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    onCategoryClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                      category: categoriesList[index],
                      index: index),
                );
              },
                itemCount: categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18
                )),
          )
        ],
      ),
    );
  }
}
