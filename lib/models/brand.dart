class Brand {
  String id;
  String name;

  Brand({
    this.id,
    this.name,
  });

  Brand fromMap(Map<String, dynamic> brandMap) {
    return Brand();
  }
}
