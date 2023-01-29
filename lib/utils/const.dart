class Const {
  static const double PARENT_MARGIN = 20.0;
  static const double SIBLING_MARGIN = 4.0;
  static const double BLUR_RADIUS = 4.0;

  static double parentMargin({double x = 1}) => Const.PARENT_MARGIN * x;

  static double siblingMargin({double x = 1}) => Const.SIBLING_MARGIN * x;

  static const double MAX_MOBILE_SCREEN = 800;
  static const double MAX_TABLET_SCREEN = 1200;
}
