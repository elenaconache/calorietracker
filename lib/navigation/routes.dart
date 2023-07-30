enum Routes {
  diary('/diary'),
  foodSearch('/foodSearch'),
  addFood('addFood'),
  unknown('/unknown'),
  login('/login'),
  accounts('accounts'),
  createFood('createFood');

  final String path;

  const Routes(this.path);
}
