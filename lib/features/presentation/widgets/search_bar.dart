import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class SearchBar extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController? controller;
  const SearchBar({Key? key, this.onTap, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: primaryColor,
            ),
            child: TextFormField(
              controller: controller,
              scrollPadding: const EdgeInsets.symmetric(horizontal: 5),
              onTap: onTap,
              keyboardType: TextInputType.text,
              style: AppTheme.normalWhiteText.copyWith(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "  Search".toUpperCase(),
                prefixIcon: const SizedBox(width: 8),
                hintStyle: AppTheme.hintText
                    .copyWith(color: Colors.white, fontSize: 16),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search_rounded, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
