part of airoute;

///
/// NavigatorManager
class NavigatorManager {
  ///
  /// Route config map.
  static Map<String, WidgetBuilder> _route = {};

  ///
  /// NavigatorManager.
  static NavigatorManager? _singleInstance;

  ///
  /// Navigator.
  // ignore: non_constant_identifier_names
  static final GlobalKey<NavigatorState> GLOBAL_KEY = GlobalKey();

  ///
  /// NavigatorManager.
  NavigatorManager._();

  ///
  /// Instance.
  static NavigatorManager? getInstance() {
    if (_singleInstance == null) {
      _singleInstance = NavigatorManager._();
    }
    return _singleInstance;
  }

  ///
  /// Initialize routes[_route].
  static Map<String, WidgetBuilder> initializeRoutes({
    required Map<String, WidgetBuilder> routes,
  }) {
    _route = routes;
    return _route;
  }

  ///
  /// Initialize generate route.
  static Route<dynamic> initializeGenerateRoute(RouteSettings routeSettings) {
    bool isInitialRoute = false;
    String routeName = routeSettings.name!;
    dynamic arguments = routeSettings.arguments;
    //Builder.
    WidgetBuilder widgetBuilder = _route[routeName]!;

    Widget widget = widgetBuilder(navigator!.context);

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
    String? routeName,
  }) {
    return navigator!.context;
  }

  ///
  /// Replace.
  pushReplacementNamed({
    required String routeName,
    dynamic argument,
  }) {
    return navigator?.pushReplacementNamed(
      routeName,
      arguments: argument,
    );
  }

  ///
  /// Push.
  pushNamed({
    required String routeName,
    dynamic argument,
  }) {
    RouteSettings routeSettings = RouteSettings(name: routeName, arguments: argument);

    WidgetBuilder widgetBuilder = _route[routeSettings.name]!;
    Widget widget = widgetBuilder(navigator!.context);

    if (widget is AirArgumentReceiver) {
      AirArgumentReceiver argumentReceiver = widget as AirArgumentReceiver;
      argumentReceiver.receive(
        AirArgument(
          routeName: routeSettings.name!,
          argument: routeSettings.arguments,
          isInitialRoute: false,
        ),
      );
      return navigator?.push(
        CupertinoPageRoute(
          builder: (context) {
            return widget;
          },
          settings: routeSettings,
        ),
      );
    }
    return navigator?.pushNamed(
      routeName,
      arguments: argument,
    );
  }

  ///
  /// push
  Future<T?> push<T extends Object?>({
    required Route<T> route,
  }) {
    return navigator!.push(route);
  }

  ///
  /// Push with animation.
  pushNamedWithAnimation({
    required String routeName,
    dynamic argument,
    RoutePageAnimation routePageAnimation = AirouteTransition.Slide,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return navigator?.push(
      PageRouteBuilder(
        transitionDuration: duration,
        settings: RouteSettings(
          name: routeName,
          arguments: argument,
        ),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          //WidgetBuilder
          WidgetBuilder widgetBuilder = _route[routeName]!;
          Widget? widget = widgetBuilder(navigator!.context);
          if (widget is AirArgumentReceiver) {
            AirArgumentReceiver argumentReceiver = widget as AirArgumentReceiver;
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
    if (navigator?.canPop() ?? false) {
      navigator?.pop(result);
    }
  }

  ///
  /// PopUntil[untilRouteName].
  popUntil({
    required String? untilRouteName,
  }) {
    bool isPopAll = untilRouteName == null ? true : false;
    if (isPopAll) {
      pop();
    } else {
      navigator?.popUntil(ModalRoute.withName('$untilRouteName'));
    }
  }

  ///
  /// Push[newRouteName]and remove until [untilRouteName].
  pushNamedAndRemoveUntil({
    required String newRouteName,
    required String? untilRouteName,
    dynamic argument,
    RoutePageAnimation routePageAnimation = AirouteTransition.Slide,
  }) {
    bool isRemoveAll = untilRouteName == null ? true : false;

    if (isRemoveAll) {
      //remove all.
      return navigator?.pushNamedAndRemoveUntil(
        newRouteName,
        (Route<dynamic> route) {
          return false;
        },
        arguments: argument,
      );
    } else {
      //not remove all.
      return navigator?.pushNamedAndRemoveUntil(
        newRouteName,
        ModalRoute.withName('$untilRouteName'),
        arguments: argument,
      );
    }
  }

  ///
  /// navigatorKey.
  static NavigatorState? get navigator {
    return GLOBAL_KEY.currentState;
  }
}
