import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopee Slicing',
      theme: ThemeData(
        primaryColor: const Color(0xFFEE4D2D),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const ShopeeHomePage(),
    );
  }
}

class ShopeeHomePage extends StatelessWidget {
  const ShopeeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildShopeeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            _buildBannerSection(),
            const SizedBox(height: 16),
            _buildMenuSection(),
            const SizedBox(height: 8),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildShopeeAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFEE4D2D),
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari barang di Shopee...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 9),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          const SizedBox(width: 16),
          const Icon(Icons.chat_outlined, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildBannerSection() {
    return Container(
      width: double.infinity,
      height: 180,
      child: Image.asset('assets/images/promo.jpg', fit: BoxFit.cover),
    );
  }

  Widget _buildMenuSection() {
    final List<Map<String, dynamic>> menus = [
      {
        'title': 'Gratis Ongkir\n& Voucher',
        'icon': Icons.local_shipping,
        'color': Colors.green[100],
        'iconColor': Colors.green,
      },
      {
        'title': 'ShopeePay\nSekitarmu',
        'icon': Icons.account_balance_wallet,
        'color': Colors.blue[100],
        'iconColor': Colors.blue,
      },
      {
        'title': 'Shopee\nFood',
        'icon': Icons.fastfood,
        'color': Colors.orange[100],
        'iconColor': Colors.orange,
      },
      {
        'title': 'Shopee\nMall',
        'icon': Icons.storefront,
        'color': Colors.red[100],
        'iconColor': Colors.red,
      },
      {
        'title': 'Pulsa, Tagihan\n& Tiket',
        'icon': Icons.phone_android,
        'color': Colors.cyan[100],
        'iconColor': Colors.cyan,
      },
      {
        'title': 'InFashion',
        'icon': Icons.checkroom,
        'color': Colors.pink[100],
        'iconColor': Colors.pink,
      },
      {
        'title': 'Shopee\nSupermarket',
        'icon': Icons.shopping_basket,
        'color': Colors.green[100],
        'iconColor': Colors.green[700],
      },
      {
        'title': 'Bayar Di\nTempat',
        'icon': Icons.money,
        'color': Colors.teal[100],
        'iconColor': Colors.teal,
      },
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Wrap(
        spacing: 12,
        runSpacing: 16,
        alignment: WrapAlignment.spaceAround,
        children: menus.map((menu) {
          return SizedBox(
            width: 75,
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: menu['color'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(menu['icon'], color: menu['iconColor']),
                ),
                const SizedBox(height: 8),
                Text(
                  menu['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid() {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Sepatu Sneakers Pria Kasual Original',
        'price': 'Rp 120.000',
        'sold': '10rb+',
        'image': 'assets/images/sepatu sneakers.jpg',
      },
      {
        'name': 'Tas Ransel Wanita / Backpack Fashion',
        'price': 'Rp 85.000',
        'sold': '5,2rb',
        'image': 'assets/images/tas wanita.jpg',
      },
      {
        'name': 'Jam Tangan Digital Anti Air Pria/Wanita',
        'price': 'Rp 45.000',
        'sold': '1,1rb',
        'image': 'assets/images/jam tangan.png',
      },
      {
        'name': 'Kemeja Flanel Kotak-Kotak Lengan Panjang',
        'price': 'Rp 95.000',
        'sold': '800',
        'image': 'assets/images/kemeja.jpg',
      },
      {
        'name': 'Botol Minum Tumbler Stainless Steel 500ml',
        'price': 'Rp 35.000',
        'sold': '3,5rb',
        'image': 'assets/images/tumbler.jpg',
      },
      {
        'name': 'Headset Bluetooth TWS Earphone V5.0',
        'price': 'Rp 150.000',
        'sold': '20rb+',
        'image': 'assets/images/tws.jpg',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.68,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2,
            color: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                      child: Image.asset(product['image'], fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['price'],
                        style: const TextStyle(
                          color: Color(0xFFEE4D2D),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            '4.8 | Terjual ${product['sold']}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}