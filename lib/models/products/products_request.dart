class ProductsRequest {
  int limit;
  int offset;

  ProductsRequest({
    required this.offset,
    required this.limit,
  });

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
      };
}
