enum Routes {
  diary('/diary'),
  foodSearch('/foodSearch'),
  addFood('addFood'),
  unknown('/unknown'),
  login('/login');

  final String path;

  const Routes(this.path);
}
