

// import 'package:flutter/material.dart';
// import 'package:flutter_app_template/features/advertisement/constant/admob_ids.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
//
// class InterstitialAdPart extends StatefulWidget {
//   const InterstitialAdPart({super.key});
//
//   @override
//   State<InterstitialAdPart> createState() => _InterstitialAdPartState();
// }
//
// class _InterstitialAdPartState extends State<InterstitialAdPart> {
//
//   @override
//   void initState() {
//     super.initState();
//     InterstitialAd.load(
//       adUnitId: AdMobIds.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           ad.fullScreenContentCallback = FullScreenContentCallback(
//             onAdDismissedFullScreenContent: (ad) {
//               _moveToHome();
//             },
//           );
//
//           setState(() {
//             _interstitialAd = ad;
//           });
//         },
//         onAdFailedToLoad: (err) {
//           print('Failed to load an interstitial ad: ${err.message}');
//         },
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
