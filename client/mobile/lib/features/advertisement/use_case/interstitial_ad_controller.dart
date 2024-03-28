


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constant/admob_ids.dart';

part 'interstitial_ad_controller.g.dart';

@Riverpod(keepAlive: true)
class InterstitialAdController extends _$InterstitialAdController {

  @override
  Future<InterstitialAd?> build () async {
    final ad = await load();
    return ad;
  }


  Future<InterstitialAd?> load () async {
    final completer = Completer<InterstitialAd?>();
    await InterstitialAd.load(
      adUnitId: AdMobIds.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            // Called when the ad showed the full screen content.
            onAdShowedFullScreenContent: (ad) {},
            // Called when an impression occurs on the ad.
            onAdImpression: (ad) {},
            // Called when the ad failed to show full screen content.
            onAdFailedToShowFullScreenContent: (ad, err) {
              // Dispose the ad here to free resources.
              ad.dispose();
              state = const AsyncData(null);
            },
            // Called when the ad dismissed full screen content.
            onAdDismissedFullScreenContent: (ad) {
              // Dispose the ad here to free resources.
              ad.dispose();
              state = const AsyncData(null);
            },
            // Called when a click is recorded for an ad.
            onAdClicked: (ad) {},
          );

          debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          completer.complete(ad);
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
    final data = await completer.future;
    state = AsyncData(data);
    return data;
  }
}
