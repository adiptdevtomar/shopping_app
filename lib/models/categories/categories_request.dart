class CategoriesRequest {
  final int limit;

  CategoriesRequest({
    required this.limit,
  });

  Map<String, dynamic> toJson() => {
        'limit': limit,
      };
}
