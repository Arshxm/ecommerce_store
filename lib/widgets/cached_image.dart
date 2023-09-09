import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String imageUrl; 
  CachedImage({super.key,required this.imageUrl});
  
  @override
  Widget build(BuildContext context) {
    return 
    ClipRRect(
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Container(color: Colors.red[100],),
        fit: BoxFit.cover,
        placeholder: (context, url)=>Container(color: Colors.grey,),
        imageUrl: imageUrl,),
    )
    ;
  }
}