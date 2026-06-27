class ProductListModel {
  String? error;
  int? total;
  List<ProductModel>? products;

  ProductListModel({
    this.error,
    this.total,
    this.products,
  });

  factory ProductListModel.fromJson(List<dynamic> json) {
    return ProductListModel(
      error: json.isNotEmpty ? json[0]['error']?.toString() : '',
      total: json.length > 1
          ? int.tryParse(json[1]['total'].toString()) ?? 0
          : 0,
      products: json.length > 2
          ? json
          .skip(2)
          .map((e) => ProductModel.fromJson(e))
          .toList()
          : [],
    );
  }
}

class ProductModel {
  String? id;
  String? categoryid;
  String? title;
  String? price;
  String? stock;
  String? weight;
  String? size;
  String? photo;
  String? detail;
  String? islive;
  String? isdeleted;
  String? categorytitle;

  ProductModel({
    this.id,
    this.categoryid,
    this.title,
    this.price,
    this.stock,
    this.weight,
    this.size,
    this.photo,
    this.detail,
    this.islive,
    this.isdeleted,
    this.categorytitle,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString(),
      categoryid: json['categoryid']?.toString(),
      title: json['title']?.toString(),
      price: json['price']?.toString(),
      stock: json['stock']?.toString(),
      weight: json['weight']?.toString(),
      size: json['size']?.toString(),
      photo: json['photo']?.toString(),
      detail: json['detail']?.toString(),
      islive: json['islive']?.toString(),
      isdeleted: json['isdeleted']?.toString(),
      categorytitle: json['categorytitle']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryid': categoryid,
      'title': title,
      'price': price,
      'stock': stock,
      'weight': weight,
      'size': size,
      'photo': photo,
      'detail': detail,
      'islive': islive,
      'isdeleted': isdeleted,
      'categorytitle': categorytitle,
    };
  }
}