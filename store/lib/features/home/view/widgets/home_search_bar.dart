import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/home/view_model/cubit/home_cubit.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height / 20,
      child: TextFormField(
        controller: homeCubit.searchController,
        onChanged: (text) {
          homeCubit.filterProuducts(input: text);
        },
        decoration: InputDecoration(
          hintText: "Search For Products",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              homeCubit.clearSearchBar();
            },
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ScreenSize.width / 20),
          ),
        ),
      ),
    );
  }
}
