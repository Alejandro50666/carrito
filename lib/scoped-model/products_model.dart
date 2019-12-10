import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kart/model/Product.dart';
import 'package:flutter_kart/model/hotel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsModel extends Model {
  List<Hotel> _hotelList = [];
  List<Product> _products = [];
  List<Product> _cartList = [];
  final baseUrl = 'http://api.flutterapp.in/api/';

  ProductsModel() {
    _products.add(Product(
      'Prodcuto CESAR 1',
      'Fuerte impacto',
      1400.00,
      'https://i.linio.com/p/67d950261500ea3e7c3af71c59be4e58-product.jpg',
    ));

    _products.add(Product(
      'Prodcuto CESAR 2',
      'Menos grasa',
      170.00,
      'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQVoYQa7y5HbVkyNQJk13Do0L6-e5YIlxLl0aDEs_4TVBhNyrrKxaWVis-cw8G9OYiwQHrubf9P3bGAzjJW5rKxdDDLgkCxidbblGcQucaAyWiAW7esPd0T&usqp=CAY',
    ));


    _products.add(Product(
      'Prodcuto CESAR 3',
      '100% potencia',
      500.00,
      'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSXjCzsuu7rPTQmlwu7iSJEnU2En_4chJmmjHgSZV09mtZBbrrDC3TifN5VTaMc4nHpwbnys1GMb3Lu9rQ1owAtR0omeTizmVY6SmtQnu19ylx70JpjMAiLTA&usqp=CAY',
    ));

    _products.add(Product(
      'Prodcuto CESAR 4',
      'Proteina al 100%',
      1320.00,
      'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS3P8zLoYI4NTP49P921hCHp2ThZ9Y-Q2lEkUM2KKy6mZB8SDiuQ3qwocYPWeg2BsTtrHWM6bRR_rXEDyj4XPEIDwioYm7Keg2ZpgGkYE3PgYolx1c2wVzeQA&usqp=CAY',
    ));

    _products.add(Product(
      'Prodcuto CESAR 5',
      'Fuerte Proteina',
      100,
      'https://static.carethy.net/media/4/photos/products/429291/gold-standard-100-whey-deliciosa-fresa-176-gr_1_g.jpeg',
    ));

    _hotelList.add(Hotel(
        'Prodcuto CESAR',
        'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/mg/gm/3pm/images/product-images/img_large/00084259510607l.jpg',
        'Ecatepec, EDO. México',
        '20-30 Mins',
        4.2,
        500));

    _hotelList.add(Hotel(
        'Prodcuto CESAR',
        'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSogNkN9pSzOnB1EAPrTubM576Eyl2CepMp79rVj-cn1IbyHGujy9WzP-LJlP8w3cwDq_Ox1wCsGXdGs0IrfH5CjTT-MEsymvmkNANJbOLLOP9Qqxz6A_q5kw&usqp=CAY',
        'Coacalco, EDO. México',
        '30-40 Mins',
        4.3,
        500));

    _hotelList.add(Hotel(
        'Prodcuto CESAR',
        'https://http2.mlstatic.com/pre-entreno-insane-labz-psychotic-gold-35-servicios-D_NQ_NP_607867-MLM29494742196_022019-F.webp',
        'San Cristobal, EDO. México',
        '25-30 Mins',
        4.0,
        500));

  }

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get getCartList {
    return List.from(_cartList);
  }

  List<Hotel> get getHotelList {
    return List.from(_hotelList);
  }

  double get getCartPrice {
    double price = 0;
    getCartList.forEach((Product pro) {
      price += pro.price;
    });
    return price;
  }

  void addProduct(Product product) {
    final Map<String, dynamic> productMap = {
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'image':
          'https://www.dinneratthezoo.com/wp-content/uploads/2016/10/veggie-fried-rice-6-500x500.jpg',
    };

    http.post(
      baseUrl + 'products',
      body: json.encode(productMap),
      headers: {
        'Content-Type': 'application/json',
      },
    ).then(
      (response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      },
    );
    _products.add(product);
    notifyListeners();
  }

 getProductList() async {
  final data = await  http
        .get(
      baseUrl + 'products',
    )
        .then(
      (response) {
       
      },
    );
    
  }

  void addToCart(Product product) {
    _cartList.add(product);
    notifyListeners();
  }
}
