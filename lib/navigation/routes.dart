enum Routes {
  diary('/'),
  foodSearch('/foodSearch'),
  addFood('addFood'),
  unknown('/unknown');

  final String path;

  const Routes(this.path);
}
