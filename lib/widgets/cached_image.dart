// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final BoxFit? boxFit;
  const CachedImage({
    Key? key,
    required this.imageUrl,
    this.radius = 0,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Container(
          color: Colors.red[100],
        ),
        fit: boxFit,
        
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
        imageUrl: imageUrl,
      ),
    );
  }
}
