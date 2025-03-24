class SimilarRequest {
  final int id;

  SimilarRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
