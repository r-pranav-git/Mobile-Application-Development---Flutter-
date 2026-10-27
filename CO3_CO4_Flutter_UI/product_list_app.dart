
import 'package:flutter/material.dart';

void main() {
  runApp(const ProductListApp());
}

class Product {
  final String name;
  final double price;
  final double rating;
  final String imageUrl;

  const Product({
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Store',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() =>
      _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final Set<int> cartItems = {};

  final List<Product> products = const [
    Product(
      name: 'Wireless Headphones',
      price: 1499.00,
      rating: 4.5,
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
    ),
    Product(
      name: 'Smart Watch',
      price: 2499.00,
      rating: 4.3,
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
    ),
    Product(
      name: 'Running Shoes',
      price: 1999.00,
      rating: 4.2,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
    ),
    Product(
      name: 'Backpack',
      price: 999.00,
      rating: 4.0,
      imageUrl:
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
    ),
    Product(
      name: 'Camera',
      price: 18999.00,
      rating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=500',
    ),
    Product(
      name: 'Sunglasses',
      price: 799.00,
      rating: 4.1,
      imageUrl:
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final int columns =
        MediaQuery.of(context).size.width >= 700 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                const SizedBox(width: 5),
                Text('${cartItems.length}'),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Text(
              'Explore Products',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final Product product = products[index];
                final bool isAdded = cartItems.contains(index);

                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 48,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text('${product.rating}'),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '₹${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (isAdded) {
                                      cartItems.remove(index);
                                    } else {
                                      cartItems.add(index);
                                    }
                                  });

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          isAdded
                                              ? '${product.name} removed from cart'
                                              : '${product.name} added to cart',
                                        ),
                                        duration:
                                            const Duration(
                                          seconds: 1,
                                        ),
                                      ),
                                    );
                                },
                                child: Text(
                                  isAdded ? 'Added ✓' : 'Add to Cart',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
