part of airoute;

///
/// NavigatorManager
class NavigatorManager {
  ///
  /// Route config map.
  static Map<String, AirouteBuilder> _route = {};

  ///
  /// NavigatorManager.
  static NavigatorManager _singleInstance;

  ///
  /// Navigator.
  static GlobalKey<NavigatorState> GLOBAL_KEY = GlobalKey();

  ///
  /// NavigatorManager.
  NavigatorManager._();

  ///
  /// Instance.
  static NavigatorManager getInstance() {
    if (_singleInstance == null) {
      _singleInstance = NavigatorManager._();
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
      argumentReceiver.receive(
        AirArgument(
          routeName: routeName,
          argument: arguments,
          isInitialRoute: isInitialRoute,
        ),
      );
    }

    return CupertinoPageRoute(
      builder: (_) {
        return widget;
      },
      settings: routeSettings,
    );
  }

  ///
  /// Context.
  BuildContext context({
    String routeName,
  }) {
    return navigator.context;
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
  /// push
  Future<T> push<T extends Object>({
    @required Route<T> route,
  }) {
    return navigator.push(route);
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
            argumentReceiver.receive(
              AirArgument(
                argument: argument,
                routeName: routeName,
              ),
            );
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
  /// navigatorKey.
  NavigatorState get navigator {
    return GLOBAL_KEY.currentState;
  }
}
