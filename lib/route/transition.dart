part of airoute;

///
/// AirouteTransition
class AirouteTransition {
  ///
  /// default scale animation
  static Widget _scale(
    BuildContext? context,
    Animation<double>? animation,
    Animation<double>? secondaryAnimation,
    Widget? page,
  ) {
    return ScaleTransition(
      scale: animation!,
      alignment: Alignment.topRight,
      child: page,
    );
  }

  ///
  /// default slide animation
  static Widget _slide(
    BuildContext? context,
    Animation<double>? animation,
    Animation<double>? secondaryAnimation,
    Widget? page,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation!),
      child: page,
    );
  }

  ///
  /// default fade animation
  static Widget _fade(
    BuildContext? context,
    Animation<double>? animation,
    Animation<double>? secondaryAnimation,
    Widget? page,
  ) {
    return FadeTransition(
      opacity: animation!,
      child: page,
    );
  }

  ///
  /// default rotation animation
  static Widget _rotation(
    BuildContext? context,
    Animation<double>? animation,
    Animation<double>? secondaryAnimation,
    Widget? page,
  ) {
    return RotationTransition(
      turns: animation!,
      alignment: Alignment.center,
      child: page,
    );
  }

  ///
  /// Slide
  static const RoutePageAnimation Slide = _slide;

  ///
  /// Fade.
  static const RoutePageAnimation Fade = _fade;

  ///
  /// Scale.
  static const RoutePageAnimation Scale = _scale;

  ///
  /// Rotation.
  static const RoutePageAnimation Rotation = _rotation;
}
