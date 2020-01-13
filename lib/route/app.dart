part of airoute;

typedef AirouteBuilder = Widget Function();

///
/// AirApp
class AirouteApp {
  ///
  /// Create MaterialApp
  static MaterialApp createMaterialApp({
    Key key,
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, AirouteBuilder> routes = const <String, AirouteBuilder>{},
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
    Map<LocalKey, ActionFactory> actions,
  }) {
    RouteManager.initializeRoutes(
      routes: routes,
    );
    List<NavigatorObserver> observers = [];
    observers.addAll(navigatorObservers);
    observers.add(RouteManager.getInstance());

    return MaterialApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      initialRoute: initialRoute,
      onGenerateRoute: RouteManager.initializeGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: observers,
      builder: (BuildContext context, Widget child) {
        return child;
      },
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
    );
  }

  ///
  /// Create CupertinoApp
  static CupertinoApp createCupertinoApp({
    Key key,
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, AirouteBuilder> routes = const <String, AirouteBuilder>{},
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    TransitionBuilder builder,
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Color color,
    CupertinoThemeData theme,
    CupertinoThemeData darkTheme,
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
    Map<LocalKey, ActionFactory> actions,
  }) {
    RouteManager.initializeRoutes(
      routes: routes,
    );
    List<NavigatorObserver> observers = [];
    observers.addAll(navigatorObservers);
    observers.add(RouteManager.getInstance());

    return CupertinoApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      initialRoute: initialRoute,
      onGenerateRoute: RouteManager.initializeGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: observers,
      builder: (BuildContext context, Widget child) {
        return child;
      },
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }

  ///
  /// Create CupertinoApp
  static WidgetsApp createWidgetsApp({
    Key key,
    GlobalKey<NavigatorState> navigatorKey,
    Widget home,
    Map<String, AirouteBuilder> routes = const <String, AirouteBuilder>{},
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    TransitionBuilder builder,
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Color color,
    CupertinoThemeData theme,
    CupertinoThemeData darkTheme,
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
    Map<LocalKey, ActionFactory> actions,
  }) {
    RouteManager.initializeRoutes(
      routes: routes,
    );
    List<NavigatorObserver> observers = [];
    observers.addAll(navigatorObservers);
    observers.add(RouteManager.getInstance());

    return WidgetsApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      initialRoute: initialRoute,
      onGenerateRoute: RouteManager.initializeGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: observers,
      builder: (BuildContext context, Widget child) {
        return child;
      },
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }
}
