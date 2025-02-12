import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../AdLoader/AdLoaderProvider.dart';
import '../../../MainJson/MainJson.dart';

class GoogleRewarded {
  RewardedAd? _rewardedAd;

  void loadAd(
      {required BuildContext context,
      required Function() onLoaded,
      required Function() onComplete,
      required Function() onFailed}) {
    MainJson mainJson = context.read<MainJson>();

    RewardedAd.load(
      adUnitId: '${mainJson.data!['adIds']['google']['reward']}',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;

          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {},
              onAdImpression: (ad) {},
              onAdFailedToShowFullScreenContent: (ad, err) {
                onFailed();
                ad.dispose();
              },
              onAdDismissedFullScreenContent: (ad) {
                if (mainJson.data![mainJson.version]['globalConfig']
                    ['rewardOverRide']) {
                  onComplete();
                }
                context.read<AdLoaderProvider>().isAdLoading = false;
                ad.dispose();
              },
              onAdClicked: (ad) {});
          onLoaded();
          _rewardedAd!.show(
            onUserEarnedReward: (ad, reward) {
              onComplete();
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          onFailed();
        },
      ),
    );
  }
}
