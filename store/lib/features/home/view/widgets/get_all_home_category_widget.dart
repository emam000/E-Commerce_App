import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/category/model/category_model.dart';
import 'package:store/features/products/view/products_by_Category_view.dart';

class GetAllHomeCategoryWidget extends StatelessWidget {
  const GetAllHomeCategoryWidget({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenSize.height / 6,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: ScreenSize.width / 20),
        itemBuilder: (context, index) {
          return Column(
            children: [
              spaceVertical(height: ScreenSize.height / 35),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsByCategoryView(
                              categoryModel: categories[index])));
                },
                child: CircleAvatar(
                  radius: ScreenSize.width / 10,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: categories[index].image,
                      height: ScreenSize.height / 5,
                      width: ScreenSize.width / 5,
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.white,
                          child: CircleAvatar(
                            radius: ScreenSize.width / 10,
                            backgroundColor: Colors.grey,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text(
                categories[index].name,
                style: TextStyle(
                  fontSize: ScreenSize.width / 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
