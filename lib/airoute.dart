library airoute;

///
/// Import
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// Part
part 'route/route.dart';
part 'route/argument_receiver.dart';
part 'route/argument.dart';
part 'route/app.dart';
part 'route/transition.dart';

///
/// Airoute
class Airoute {
  ///
  /// Create material app.
  static createMaterialApp({
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
    AirouteApp.createMaterialApp(
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
  /// Replace.
  static pushReplacementNamed({
    String routeName,
    dynamic argument,
  }) {
    return RouteManager.getInstance().pushReplacementNamed(
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
    return RouteManager.getInstance()
      ..pushNamed(
        routeName: routeName,
        argument: argument,
      );
  }

  ///
  /// Push with animation.
  static pushNamedWithAnimation({
    @required String routeName,
    dynamic argument,
    RoutePageAnimation routePageAnimation,
    Duration duration,
  }) {
    return RouteManager.getInstance().pushNamedWithAnimation(
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
    RouteManager.getInstance().pop(
      result: result,
    );
  }

  ///
  /// PopUntil[untilRouteName].
  static popUntil({
    String untilRouteName,
  }) {
    RouteManager.getInstance().popUntil(
      untilRouteName: untilRouteName,
    );
  }

  ///
  /// Push[newRouteName]and remove until [untilRouteName].
  static pushNamedAndRemoveUntil({
    @required String newRouteName,
    String untilRouteName,
    dynamic argument,
    RoutePageAnimation routePageAnimation,
  }) {
    RouteManager.getInstance().pushNamedAndRemoveUntil(
      newRouteName: newRouteName,
      untilRouteName: untilRouteName,
      argument: argument,
      routePageAnimation: routePageAnimation,
    );
  }
}
