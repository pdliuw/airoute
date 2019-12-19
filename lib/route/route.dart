part of airoute;

///
/// Animation
typedef RoutePageAnimation = Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget page);

///
/// Route manager
class RouteManager extends NavigatorObserver {
  ///
  /// Route config map.
  static Map<String, AirouteBuilder> _route = {};

  ///
  /// RouteManager.
  static RouteManager _singleInstance;

  ///
  /// StreamController.
  static StreamController _streamController;

  ///
  /// Navigator.
  NavigatorState navigator;

  ///
  /// RouteManaqer.
  RouteManager._();

  ///
  /// Instance.
  static RouteManager getInstance() {
    if (_singleInstance == null) {
      _singleInstance = RouteManager._();

      _streamController = StreamController.broadcast();
    }
    return _singleInstance;
  }

  ///
  /// Initialize routes[_route].
  static Map<String, AirouteBuilder> initializeRoutes({
    @required Map<String, AirouteBuilder> routes,
  }) {
    _route = routes ?? {};
    return null;
  }

  ///
  /// Initialize generate route.
  static Route<dynamic> initializeGenerateRoute(RouteSettings routeSettings) {
    bool isInitialRoute = routeSettings.isInitialRoute;
    String routeName = routeSettings.name;
    dynamic arguments = routeSettings.arguments;
    //Builder.
    AirouteBuilder airBuilder = _route[routeName];
    Widget widget = airBuilder();

    if (widget is AirArgumentReceiver) {
      AirArgumentReceiver argumentReceiver = widget as AirArgumentReceiver;
      argumentReceiver.receive(AirArgument(argument: arguments));
    }

    return CupertinoPageRoute(
      builder: (_) {
        return widget;
      },
      settings: routeSettings,
    );
  }

  ///
  /// Routes.
  static List<Route> _mRoutes;

  ///
  /// Route.
  List<Route> get routes => _mRoutes;

  ///
  /// Current route.
  Route get currentRoute => _mRoutes[_mRoutes.length - 1];

  StreamController get streamController => _streamController;

  ///
  /// Context.
  BuildContext context({
    String routeName,
  }) {
    if (routeName != null) {
      return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
      )?.navigator?.context;
    }
    return currentRoute?.navigator?.context;
  }

  ///
  /// Replace.
  pushReplacementNamed({
    String routeName,
    dynamic argument,
  }) {
    return navigator.pushReplacementNamed(
      routeName,
      arguments: argument,
    );
  }

  ///
  /// Push.
  pushNamed({
    String routeName,
    dynamic argument,
  }) {
    return navigator.pushNamed(
      routeName,
      arguments: argument,
    );
  }

  ///
  /// Push with animation.
  pushNamedWithAnimation({
    @required String routeName,
    dynamic argument,
    RoutePageAnimation routePageAnimation = AirouteTransition.Slide,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return navigator.push(
      PageRouteBuilder(
        transitionDuration: duration,
        settings: RouteSettings(
          name: routeName,
          arguments: argument,
        ),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //WidgetBuilder
          AirouteBuilder airouteBuilder = _route[routeName];
          Widget widget = airouteBuilder();
          if (widget is AirArgumentReceiver) {
            AirArgumentReceiver argumentReceiver =
                widget as AirArgumentReceiver;
            argumentReceiver.receive(AirArgument(argument: argument));
          }
          //Route page animation
          return routePageAnimation(
            context,
            animation,
            secondaryAnimation,
            widget,
          );
        },
      ),
    );
  }

  ///
  /// Pop.
  pop({
    dynamic result,
  }) {
    if (navigator.canPop()) {
      navigator.pop(result);
    }
  }

  ///
  /// PopUntil[untilRouteName].
  popUntil({
    String untilRouteName,
  }) {
    bool isPopAll = untilRouteName == null ? true : false;
    if (isPopAll) {
      navigator.popUntil(
        (Route<dynamic> route) {
          return false;
        },
      );
    } else {
      navigator.popUntil(ModalRoute.withName('$untilRouteName'));
    }
  }

  ///
  /// Push[newRouteName]and remove until [untilRouteName].
  pushNamedAndRemoveUntil({
    @required String newRouteName,
    String untilRouteName,
    dynamic argument,
    RoutePageAnimation routePageAnimation = AirouteTransition.Slide,
  }) {
    bool isRemoveAll = untilRouteName == null ? true : false;

    if (isRemoveAll) {
      //remove all.
      return navigator.pushNamedAndRemoveUntil(
        newRouteName,
        (Route<dynamic> route) {
          return false;
        },
        arguments: argument,
      );
    } else {
      //not remove all.
      return navigator.pushNamedAndRemoveUntil(
        newRouteName,
        ModalRoute.withName('$untilRouteName'),
        arguments: argument,
      );
    }
  }

  ///
  /// DisPush.
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (_mRoutes == null) {
      _mRoutes = new List<Route>();
    }
    // filter route type.
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      _mRoutes.add(route);
      routeObserver();
    }
  }

  ///
  /// DisReplace.
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
  /// DidPop.
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      _mRoutes.remove(route);
      routeObserver();
    }
  }

  ///
  /// DidRemove.
  @override
  void didRemove(Route removedRoute, Route oldRoute) {
    super.didRemove(removedRoute, oldRoute);
    if (removedRoute is CupertinoPageRoute ||
        removedRoute is MaterialPageRoute) {
      _mRoutes.remove(removedRoute);
      routeObserver();
    }
  }

  ///
  /// RouteObserver.
  void routeObserver() {
    navigator = _mRoutes[_mRoutes.length - 1].navigator;
    streamController.sink.add(_mRoutes);
  }
}
