import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appbarTitle,
    this.onPressedSearch,
    required this.onPressedIconFavorite,
    this.onChanged,
    required this.myController,
  });

  final String appbarTitle;
  final void Function()? onPressedSearch;
  final void Function() onPressedIconFavorite;
  final void Function(String)? onChanged;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedSearch),
                hintText: appbarTitle,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // const SizedBox(width: 10),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.grey[200],
          //   ),
          //   width: 60,
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   child: IconButton(
          //     onPressed: onPressedIcon,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 30,
          //       color: Colors.grey[600],
          //     ),
          //   ),
          // ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
