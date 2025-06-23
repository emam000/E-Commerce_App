import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/category/model/category_model.dart';
import 'package:store/features/products/view/products_by_Category_view.dart';

class GetAllCategoriesWidget extends StatelessWidget {
  const GetAllCategoriesWidget({
    super.key,
    required this.categories,
  });
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductsByCategoryView(
                        categoryModel: categories[index])));
          },
          child: Container(
            margin: EdgeInsets.all(ScreenSize.width / 50),
            padding: EdgeInsets.all(ScreenSize.width / 50),
            height: ScreenSize.height / 2.5,
            width: ScreenSize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenSize.width / 50),
              color: Colors.grey,
            ),
            child: Stack(alignment: Alignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenSize.width / 50),
                child: CachedNetworkImage(
                  imageUrl: categories[index].image,
                  height: ScreenSize.height / 2.5,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.white,
                      child: Container(
                        height: ScreenSize.height / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.circular(ScreenSize.width / 50),
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenSize.height / 11,
                  width: ScreenSize.width,
                  color: Colors.black54,
                  child: Text(
                    categories[index].name,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: ScreenSize.width / 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
