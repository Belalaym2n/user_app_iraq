
class LocationSearchResult {
  final String placeId;
  final String mainText;
  final String secondaryText;
  final String fullText;
  // final LocationType type;

  LocationSearchResult({
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
    required this.fullText,
    // this.type = LocationType.custom,
  });

  factory LocationSearchResult.fromMap(Map<String, dynamic> map) {
    return LocationSearchResult(
      placeId: map['place_id'] ?? '',
      mainText: map['structured_formatting']['main_text'] ?? '',
      secondaryText: map['structured_formatting']['secondary_text'] ?? '',
      fullText: map['description'] ?? '',
      // type: LocationType.custom,
    );
  }

  String get displayText =>
      fullText.isNotEmpty ? fullText : '$mainText, $secondaryText';
}
