part of airoute;

///
/// Argument
class AirArgument {
  AirArgument({
    this.key,
    this.tag,
    this.argument,
  });

  ///
  /// [key] is the primary id.
  Key key;

  ///
  /// [tag] is the tag/flag.
  String tag;

  ///
  /// [argument] is the data.
  dynamic argument;

  @override
  String toString() {
    return "key:$key, tag:$tag, argument:${argument.toString()}";
  }
}
