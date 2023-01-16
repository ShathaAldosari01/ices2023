import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ices2023/config/palette.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.white,
      child: Center(
        child: SpinKitThreeBounce(
          size: 35.0,
          itemBuilder: (context, index){
            final colors = [Palette.yellow, Palette.blue, Palette.green];
            final color = colors[index % colors.length];

            return DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                )
            );
          }
        ),
      ),
    );
  }
}