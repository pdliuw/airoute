part of airoute;

///
/// Argument
class AirArgument {
  AirArgument({
    this.key,
    this.tag,
    this.routeName,
    this.argument,
    this.isInitialRoute = false,
  });

  ///
  /// [key] is the primary id.
  Key key;

  ///
  /// [tag] is the tag/flag.
  String tag;

  ///
  /// [routeName]
  String routeName;

  ///
  /// [isInitialRoute]
  bool isInitialRoute;

  ///
  /// [argument] is the data.
  dynamic argument;

  @override
  String toString() {
    return "key:$key, tag:$tag, routeName:$routeName, argument:${argument.toString()}, isInitialRoute:$isInitialRoute";
  }
}
