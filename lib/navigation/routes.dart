enum Routes {
  diary('/diary'),
  foodSearch('/foodSearch'),
  addFood('addFood'),
  login('/login'),
  accounts('accounts'),
  createFood('createFood'),
  profile('profile'),
  home('/home'),
  recipes('/recipes');

  final String path;

  const Routes(this.path);
}
