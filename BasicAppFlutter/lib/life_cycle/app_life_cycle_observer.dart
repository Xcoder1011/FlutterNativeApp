import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';

///
///  app_life_cycle_observer.dart
///
///  Created by wushangkun on 9/11/21.
///  Copyright (c) 2021 chelun. All rights reserved.
//
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  @override
  void onBackground(Route route) {
    super.onBackground(route);
    print("AppLifecycleObserver - ${route.settings.name} - onBackground");
  }

  @override
  void onForeground(Route route) {
    super.onForeground(route);
    print("AppLifecycleObserver ${route.settings.name} - onForground");
  }

  @override
  void onPagePush(Route route) {
    super.onPagePush(route);
    print("AppLifecycleObserver - ${route.settings.name}- onPagePush");
  }

  @override
  void onPagePop(Route route) {
    super.onPagePop(route);
    print("AppLifecycleObserver - ${route.settings.name}- onPagePop");
  }

  @override
  void onPageHide(Route route) {
    super.onPageHide(route);
    print("AppLifecycleObserver - ${route.settings.name}- onPageHide");
  }

  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    print("AppLifecycleObserver - ${route.settings.name}- onPageShow");
  }
}
