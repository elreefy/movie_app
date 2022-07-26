import 'package:flutter/cupertino.dart';

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(w * 1 / 9, 0);
    path.lineTo(0, h);
    path.lineTo(w * 8 / 9, h);
    path.lineTo(w, 0);
    path.close();
    throw UnimplementedError();
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
