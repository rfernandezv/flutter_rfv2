class Product {
  int id;
  String name;
  String description;
  double price;
  int categoryId;

  Product(this.name, this.description, this.price, this.categoryId);
  Product.withId(this.id, this.name, this.description, this.price, this.categoryId);
}