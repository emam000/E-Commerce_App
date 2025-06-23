import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/home/model/banner_model.dart';

class GetAllBannersWidget extends StatelessWidget {
  const GetAllBannersWidget({
    super.key,
    required this.pageController,
    required this.banners,
  });

  final PageController pageController;
  final List<BannerModel> banners;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        physics: BouncingScrollPhysics(),
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: ScreenSize.width / 20,
              left: ScreenSize.width / 20,
            ),
            child: CachedNetworkImage(
              imageUrl: banners[index].image,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.grey,
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
