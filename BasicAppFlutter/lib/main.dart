import 'package:BasicAppFlutter/life_cycle/app_life_cycle_observer.dart';
import 'package:BasicAppFlutter/pages/dialog_page.dart';
import 'package:BasicAppFlutter/pages/lifecycle_test_page.dart';
import 'package:BasicAppFlutter/pages/main_page.dart';
import 'package:BasicAppFlutter/pages/replacement_page.dart';
import 'package:BasicAppFlutter/pages/simple_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

void main() {
  ///添加全局生命周期监听类
  PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());

  ///这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
  CustomFlutterBinding();

  runApp(MyApp());
}

///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'mainPage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            Map<String, Object> map = settings.arguments ?? {};
            String data = map['data'] ?? '';
            return MainPage(
              data: data,
            );
          });
    },

    'simplePage': (settings, uniqueId) {
      Map<String, Object> map = settings.arguments ?? {};
      String data = map['data'] ?? '';
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => SimplePage(
          data: data,
        ),
      );
    },
    'tab1': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => TabPage(
          color: Colors.blue,
          title: 'Tab1',
        ),
      );
    },
    'tab2': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => TabPage(
          color: Colors.red,
          title: 'Tab2',
        ),
      );
    },
    'tab3': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => TabPage(
          color: Colors.orange,
          title: 'Tab3',
        ),
      );
    },

    ///生命周期例子页面
    'lifecyclePage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (ctx) {
            return LifecycleTestPage();
          });
    },
    'replacementPage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (ctx) {
            return ReplacementPage();
          });
    },

    ///透明弹窗页面
    'dialogPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(

          ///透明弹窗页面这个需要是false
          opaque: false,

          ///背景蒙版颜色
          barrierColor: Colors.black12,
          settings: settings,
          pageBuilder: (_, __, ___) => DialogPage());
    },
  };

  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}

class TabPage extends StatelessWidget {
  final String title;
  final Color color;
  const TabPage({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Text(title ?? '', style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
