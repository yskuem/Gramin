/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon_back_image.png
  AssetGenImage get iconBackImage =>
      const AssetGenImage('assets/images/icon_back_image.png');

  /// File path: assets/images/icon_fore_image.png
  AssetGenImage get iconForeImage =>
      const AssetGenImage('assets/images/icon_fore_image.png');

  /// File path: assets/images/neko.jpg
  AssetGenImage get neko => const AssetGenImage('assets/images/neko.jpg');

  /// File path: assets/images/quiz_back_1.jpg
  AssetGenImage get quizBack1 =>
      const AssetGenImage('assets/images/quiz_back_1.jpg');

  /// File path: assets/images/tutorial_pic1.jpeg
  AssetGenImage get tutorialPic1 =>
      const AssetGenImage('assets/images/tutorial_pic1.jpeg');

  /// File path: assets/images/tutorial_pic2.png
  AssetGenImage get tutorialPic2 =>
      const AssetGenImage('assets/images/tutorial_pic2.png');

  /// File path: assets/images/tutorial_pic3.png
  AssetGenImage get tutorialPic3 =>
      const AssetGenImage('assets/images/tutorial_pic3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconBackImage,
        iconForeImage,
        neko,
        quizBack1,
        tutorialPic1,
        tutorialPic2,
        tutorialPic3
      ];
}

class $AssetsSoundGen {
  const $AssetsSoundGen();

  /// File path: assets/sound/correct.mp3
  String get correct => 'assets/sound/correct.mp3';

  /// File path: assets/sound/incorrect.mp3
  String get incorrect => 'assets/sound/incorrect.mp3';

  /// List of all assets
  List<String> get values => [correct, incorrect];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSoundGen sound = $AssetsSoundGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
