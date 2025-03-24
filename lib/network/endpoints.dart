class ApiEndpoints {
  static String products = '/products';
  static String categories = '/categories';

  static String similarProducts(index) => '/products/$index/related';
}
