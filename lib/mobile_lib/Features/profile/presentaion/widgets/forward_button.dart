import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';


class ForwardButton extends StatelessWidget {
  final Function() onTap;
  const ForwardButton({
     required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.navigate_next_outlined , color: AppColors.blue,),
      ),
    );
  }
}
