enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'mdbee dev';
      case Flavor.production:
        return 'mdbee';
      default:
        return 'title';
    }
  }

}
