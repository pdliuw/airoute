part of airoute;

///
/// Airoute
class Airoute {
  ///
  /// Create MaterialApp.
  static MaterialApp createMaterialApp({
    Key key,
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    TransitionBuilder builder,
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Color color,
    ThemeData theme,
    ThemeData darkTheme,
    ThemeMode themeMode = ThemeMode.system,
    Locale locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocaleListResolutionCallback localeListResolutionCallback,
    LocaleResolutionCallback localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool debugShowMaterialGrid = false,
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = true,
    Map<LogicalKeySet, Intent> shortcuts,
    Map<Type, Action<Intent>> actions,
  }) {
    return AirouteApp.createMaterialApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
    );
  }

  ///
  /// Create CupertinoApp.
  static CupertinoApp createCupertinoApp({
    Key key,
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    TransitionBuilder builder,
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Color color,
    ThemeData theme,
    ThemeData darkTheme,
    ThemeMode themeMode = ThemeMode.system,
    Locale locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocaleListResolutionCallback localeListResolutionCallback,
    LocaleResolutionCallback localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool debugShowMaterialGrid = false,
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = true,
    Map<LogicalKeySet, Intent> shortcuts,
    Map<Type, Action<Intent>> actions,
  }) {
    return AirouteApp.createCupertinoApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
    );
  }

  ///
  /// Create WidgetsApp.
  static WidgetsApp createWidgetsApp({
    Key key,
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    TransitionBuilder builder,
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Color color,
    ThemeData theme,
    ThemeData darkTheme,
    ThemeMode themeMode = ThemeMode.system,
    Locale locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocaleListResolutionCallback localeListResolutionCallback,
    LocaleResolutionCallback localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool debugShowMaterialGrid = false,
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = true,
    Map<LogicalKeySet, Intent> shortcuts,
    Map<Type, Action<Intent>> actions,
  }) {
    return AirouteApp.createWidgetsApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
    );
  }

  ///
  /// Replace.
  static pushReplacementNamed({
    String routeName,
    dynamic argument,
  }) {
    return NavigatorManager.getInstance().pushReplacementNamed(
      routeName: routeName,
      argument: argument,
    );
  }

  ///
  /// Push.
  static pushNamed({
    String routeName,
    dynamic argument,
  }) {
    return NavigatorManager.getInstance().pushNamed(
      routeName: routeName,
      argument: argument,
    );
  }

  ///
  /// push
  static Future<T> push<T extends Object>({
    @required Route<T> route,
  }) {
    return NavigatorManager.getInstance().push(
      route: route,
    );
  }

  ///
  /// Push with animation.
  static pushNamedWithAnimation({
    @required String routeName,
    dynamic argument,
    RoutePageAnimation routePageAnimation = AirouteTransition.Fade,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return NavigatorManager.getInstance().pushNamedWithAnimation(
      routeName: routeName,
      argument: argument,
      routePageAnimation: routePageAnimation,
      duration: duration,
    );
  }

  ///
  /// Pop.
  static pop({
    dynamic result,
  }) {
    NavigatorManager.getInstance().pop(
      result: result,
    );
  }

  ///
  /// PopUntil[untilRouteName].
  static popUntil({
    String untilRouteName,
  }) {
    NavigatorManager.getInstance().popUntil(
      untilRouteName: untilRouteName,
    );
  }

  ///
  /// Push[newRouteName]and remove until [untilRouteName].
  static pushNamedAndRemoveUntil({
    @required String newRouteName,
    String untilRouteName,
    dynamic argument,
    RoutePageAnimation routePageAnimation = AirouteTransition.Fade,
  }) {
    NavigatorManager.getInstance().pushNamedAndRemoveUntil(
      newRouteName: newRouteName,
      untilRouteName: untilRouteName,
      argument: argument,
      routePageAnimation: routePageAnimation,
    );
  }
}
