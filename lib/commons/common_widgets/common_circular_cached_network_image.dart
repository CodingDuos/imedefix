import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedCircularNetworkImageWidget extends StatelessWidget {
  const CachedCircularNetworkImageWidget({
    super.key,
    required this.image, required this.size,
  });

  final String image;
  final int size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.h,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => Center(
            child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: const CircularProgressIndicator())),
        errorWidget: (context, url, error) => Center(
            child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: const Icon(Icons.error))),
      ),
    );
  }
}