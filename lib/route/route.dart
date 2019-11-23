part of flutter_route;

typedef RoutePageAnimation = Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget page);

///
/// Route manager
class RouteManager extends NavigatorObserver {
  ///
  /// 配置路由
  static Map<String, WidgetBuilder> _configRoutes = {};

  static RouteManager _singleInstance;

  ///
  /// stream相关
  static StreamController _streamController;

  // 用来路由跳转
  NavigatorState navigator;

  ///
  /// default scale animation
  static Widget _defaultRoutePageScaleAnimation(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget page) {
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.topRight,
      child: page,
    );
  }

  ///
  /// default slide animation
  static Widget defaultRoutePageSlideAnimation(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget page) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: page,
    );
  }

  ///
  /// default fade animation
  static Widget defaultRoutePageFadeAnimation(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget page) {
    return FadeTransition(
      opacity: animation,
      child: page,
    );
  }

  ///
  /// default rotation animation
  static Widget defaultRoutePageRotationAnimation(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget page) {
    return RotationTransition(
      turns: animation,
      alignment: Alignment.center,
      child: page,
    );
  }

  ///
  /// default route page animation!
  static RoutePageAnimation _defaultRoutePageAnimation =
      defaultRoutePageSlideAnimation;

  ///
  /// private constructor
  RouteManager._();

  static RouteManager getInstance() {
    if (_singleInstance == null) {
      _singleInstance = RouteManager._();

      _streamController = StreamController.broadcast();
    }
    return _singleInstance;
  }

  static Map<String, WidgetBuilder> initializeRoutes(
      {@required Map<String, WidgetBuilder> routes}) {
    _configRoutes = routes;
    return _configRoutes;
  }

  ///
  /// 当前路由栈
  static List<Route> _mRoutes;

  List<Route> get routes => _mRoutes;

  ///
  /// 当前路由
  Route get currentRoute => _mRoutes[_mRoutes.length - 1];

  StreamController get streamController => _streamController;

  BuildContext context({String routeName}) {
    if (routeName != null) {
      return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
      )?.navigator?.context;
    }
    return currentRoute?.navigator?.context;
  }

  ///
  /// replace 页面
  pushReplacementNamed(String routeName, [WidgetBuilder builder]) {
    return navigator.pushReplacement(
      CupertinoPageRoute(
        builder: builder ?? _configRoutes[routeName],
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  ///
  /// push 页面
  pushNamed(String routeName, [WidgetBuilder builder]) {
    return navigator.push(
      CupertinoPageRoute(
        builder: builder ?? _configRoutes[routeName],
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  pushNamedWithAnimation({
    @required String routeName,
    RoutePageAnimation routePageAnimation,
  }) {
    if (routePageAnimation == null) {
      routePageAnimation = _defaultRoutePageAnimation;
    }
    return navigator.push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        settings: RouteSettings(name: routeName),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          /*
          WidgetBuilder
           */
          WidgetBuilder widgetBuilder = _configRoutes[routeName];
          Widget widget = widgetBuilder(context);
          /*
          Route page animation
           */
          return routePageAnimation(
              context, animation, secondaryAnimation, widget);
        },
      ),
    );
  }

  ///
  /// pop 页面
  pop<T extends Object>([T result]) {
    navigator.pop(result);
  }

  ///
  /// push一个页面， 移除该页面下面所有页面
  pushNamedAndRemoveUntil(
      {@required String newRouteName,
      RoutePageAnimation routePageAnimation =
          _defaultRoutePageScaleAnimation}) {
    return navigator.pushNamedAndRemoveUntil(
      newRouteName,
      (Route<dynamic> route) {
        return false;
      },
    );
  }

  ///
  /// 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (_mRoutes == null) {
      _mRoutes = new List<Route>();
    }
    // 这里过滤调push的是dialog的情况
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      _mRoutes.add(route);
      routeObserver();
    }
  }

  ///
  /// 当调用Navigator.replace时回调
  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace();
    if (newRoute is CupertinoPageRoute || newRoute is MaterialPageRoute) {
      _mRoutes.remove(oldRoute);
      _mRoutes.add(newRoute);
      routeObserver();
    }
  }

  ///
  /// 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      _mRoutes.remove(route);
      routeObserver();
    }
  }

  @override
  void didRemove(Route removedRoute, Route oldRoute) {
    super.didRemove(removedRoute, oldRoute);
    if (removedRoute is CupertinoPageRoute ||
        removedRoute is MaterialPageRoute) {
      _mRoutes.remove(removedRoute);
      routeObserver();
    }
  }

  void routeObserver() {
//  LogUtil.i(sName, '&&路由栈&&');
//  LogUtil.i(sName, _mRoutes);
//  LogUtil.i(sName, '&&当前路由&&');
//  LogUtil.i(sName, _mRoutes[_mRoutes.length - 1]);
    /*
    当前页面的navigator，用来路由跳转
     */
    navigator = _mRoutes[_mRoutes.length - 1].navigator;
    streamController.sink.add(_mRoutes);
  }
}
