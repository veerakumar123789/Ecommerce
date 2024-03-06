import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Provider/cardProvider.dart';
import '../Provider/favoriteProvider.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final cart = CardProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => provider.toggleFavorite(widget.product),
                child: Icon(
                  provider.isExit(widget.product) ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.product.image!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8), // Add some spacing between the image and the text
          Text(
            widget.product.name!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.product.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                height: 50,
                width: 80,
                child: ElevatedButton(

                  onPressed: () {
                    cart.toggleFavorite(widget.product);
                  },
                  child: Text('Add',style: TextStyle(fontSize: 12,color: Colors.black87)),
                ),
              ),
            ],
          ),
// Add some spacing between the price and the button

        ],
      ),
    );
  }
}
