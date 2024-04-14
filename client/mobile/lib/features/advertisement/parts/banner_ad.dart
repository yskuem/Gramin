
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constant/admob_ids.dart';


class BannerAdPart extends StatefulWidget {
  const BannerAdPart({super.key});

  @override
  State<BannerAdPart> createState() => _BannerAdPartState();
}

class _BannerAdPartState extends State<BannerAdPart> {


  BannerAd? bannerAd;

  @override
  void initState() {
    super.initState();
    BannerAd(
      adUnitId: AdMobIds.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }
  @override
  Widget build(BuildContext context) {
    if(bannerAd == null) {
      return const SizedBox();
    }
    return SizedBox(
      width: bannerAd!.size.width.toDouble(),
      height: bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: bannerAd!),
    );
  }
}







