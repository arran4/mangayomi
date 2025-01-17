import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mangayomi/modules/manga/reader/reader_view.dart';
import 'package:mangayomi/src/rust/api/image.dart';
import 'package:mangayomi/utils/extensions/others.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'crop_borders_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Uint8List?> cropBorders(CropBordersRef ref,
    {required UChapDataPreload data, required bool cropBorder}) async {
  Uint8List? imageBytes;

  if (cropBorder) {
    imageBytes = await data.getImageBytes;

    if (imageBytes == null) {
      return null;
    }

    return processCropImage(image: imageBytes);
  }
  return null;
}
