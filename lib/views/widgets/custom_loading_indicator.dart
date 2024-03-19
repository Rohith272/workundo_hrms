import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class CustomLoadingIndicator extends StatelessWidget {
  final double? width;
  final double? height;
  final int? type;
  final Color? color;
  const CustomLoadingIndicator({
    this.width,
    this.height,
    this.type,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          width: width ?? 40,
          height: height ?? 40,
          child: LoadingIndicator(
            colors: color != null ? [color!] : [Colors.white],
            indicatorType: type != null ? Indicator.values[type!] : Indicator.values[18] ,
            strokeWidth: 3,
            // pathBackgroundColor: Colors.black45,
          ),
        ));
  }
}
